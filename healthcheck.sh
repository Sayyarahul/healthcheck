#!/bin/bash
# ==========================================
# 🩺 SYSTEM HEALTH CHECK SCRIPT (CROSS-PLATFORM)
# Author: Rahul Sayya
# ==========================================

LOGFILE="healthlog.txt"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "==========================================" | tee -a "$LOGFILE"
echo "🩺 SYSTEM HEALTH REPORT - $TIMESTAMP" | tee -a "$LOGFILE"
echo "==========================================" | tee -a "$LOGFILE"

OS=$(uname | tr '[:upper:]' '[:lower:]')

echo -e "\n📅 Date & Time: $(date)" | tee -a "$LOGFILE"

# Uptime
echo -e "\n⏱️ Uptime:" | tee -a "$LOGFILE"
if [[ "$OS" == *"mingw"* || "$OS" == *"cygwin"* || "$OS" == *"windows"* ]]; then
    systeminfo | grep "System Boot Time" | tee -a "$LOGFILE" || echo "Uptime info not available" | tee -a "$LOGFILE"
else
    uptime | tee -a "$LOGFILE"
fi

# CPU Load
echo -e "\n⚙️ CPU Load:" | tee -a "$LOGFILE"
if [[ "$OS" == *"mingw"* || "$OS" == *"cygwin"* ]]; then
    wmic cpu get loadpercentage 2>/dev/null | grep -v LoadPercentage | tee -a "$LOGFILE" || echo "CPU Load info not available" | tee -a "$LOGFILE"
else
    top -bn1 | grep "load average" | tee -a "$LOGFILE"
fi

# Memory Usage
echo -e "\n💾 Memory Usage (MB):" | tee -a "$LOGFILE"
if command -v free &>/dev/null; then
    free -m | tee -a "$LOGFILE"
elif [[ "$OS" == *"mingw"* || "$OS" == *"cygwin"* ]]; then
    systeminfo | grep "Total Physical Memory" -A1 | tee -a "$LOGFILE"
else
    echo "Memory info not available" | tee -a "$LOGFILE"
fi

# Disk Usage
echo -e "\n💽 Disk Usage:" | tee -a "$LOGFILE"
df -h | tee -a "$LOGFILE"

# Top 5 Memory-Consuming Processes
echo -e "\n🔥 Top 5 Memory-Consuming Processes:" | tee -a "$LOGFILE"
if [[ "$OS" == *"mingw"* || "$OS" == *"cygwin"* ]]; then
    tasklist | sort /R | head -n 10 | tee -a "$LOGFILE"
else
    ps aux --sort=-%mem | head -n 6 | tee -a "$LOGFILE"
fi

# Check Services
echo -e "\n🧩 Service Status:" | tee -a "$LOGFILE"
SERVICES=("nginx" "sshd" "docker")

for service in "${SERVICES[@]}"; do
    if command -v systemctl &>/dev/null; then
        if systemctl is-active --quiet "$service"; then
            echo -e "✅ $service is running" | tee -a "$LOGFILE"
        else
            echo -e "❌ $service is NOT running" | tee -a "$LOGFILE"
        fi
    else
        sc query "$service" | grep -q "RUNNING" && \
        echo -e "✅ $service is running" | tee -a "$LOGFILE" || \
        echo -e "❌ $service is NOT running" | tee -a "$LOGFILE"
    fi
done

echo -e "\n==========================================" | tee -a "$LOGFILE"



