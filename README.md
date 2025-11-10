#  System Health Check Script (Cross-Platform)

[![Bash](https://img.shields.io/badge/Shell-Bash-blue?logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-brightgreen)](#)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A **lightweight and portable Bash-based system monitoring tool** designed to provide real-time insights into system performance and health.  
It works seamlessly across **Linux**, **macOS**, and **Windows (Git Bash / WSL)** — ideal for **DevOps engineers, sysadmins**, and **developers**.

---

##  Overview

This script performs a detailed **health check** of your system by collecting essential metrics such as uptime, CPU load, memory usage, disk space, and running services.  
Results are displayed in a **clean, color-coded terminal report** and automatically logged into `healthlog.txt` for historical tracking.

---

##  Features

✅ Displays **system date & time**  
✅ Shows **uptime** (cross-platform)  
✅ Monitors **CPU load and usage percentage**  
✅ Tracks **memory and disk usage**  
✅ Lists **top 5 memory-consuming processes**  
✅ Checks if essential services (`nginx`, `sshd`, `docker`, etc.) are running  
✅ Saves results to `healthlog.txt` with a timestamp  
✅ Works on **Linux**, **macOS**, and **Windows (Git Bash / WSL)**  

---

##  Setup and Usage

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/YOUR-USERNAME/healthcheck.git
cd healthcheck

💬 Author
👤 Developed by: Rahul Sayya
Instructor: FAVOUR LAWRENCE
📅 Year: 2025
🌐 GitHub: https://github.com/Sayyarahul/healthcheck