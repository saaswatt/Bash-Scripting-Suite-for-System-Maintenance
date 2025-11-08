# Project 5 – Bash Scripting Suite for System Maintenance

## Overview
- The System Maintenance Suite is an advanced Bash-based automation tool designed to simplify   and secure core Linux system maintenance tasks — including data backups, system updates, and log monitoring.
- It includes:
    1. Centralized logging for all modules
    2. **Error handling and traps** for safe execution
    3. **Alert mechanisms** for abnormal system log
    4. **A menu-driven CLI interface** integrating all functionalities

- This project forms part of the Capstone requirement for Bash Scripting and System Automation. It demonstrates automation, fault tolerance, and logging best practices in Linux administration- essential competencies for cybersecurity and system engineering professionals.
---

## Features
| **Module** | **Script** | **Description** | **Added Enahncements** |
|------------|------------|-----------------|------------------------|
| **Backend Automation** | `backup.sh` | Creates compressed, timestamped backup of user’s home directory | Logging, error traps, timestamp tracking |
| **System Update & Cleanup** | `update.sh` | Runs system update (`apt`), autoremove, and autoclean | Logging, error traps, structured success markers |
| **Log Monitoring & Alerting** | `log_monitor.sh` | Scans system logs for recent errors; alerts when errors exceed threshold | Error threshold alerts, detailed log file, safe grep |
| **Maintenance Suite Controller** | `main_controller.sh` | Interactive menu to run all modules from one interface | Centralized action logging and runtime validation |

---
## Technical Summary
| **Aspect** | **Implementation Details** |
|------------|-------------|
| **Language** | Bash (Bourne Again Shell) |
| **Shell Safety Flags** | `set -euo pipefail` for robust execution |
| **Error Handling** | `trap` with custom error messages and exit codes |
| **Logging** | Redirected `stdout/stderr (>> logfile 2>&1)` + timestamped entries |
| **Backup Mechanism** | `tar --exclude` with gzip compression |
| **Package Management** | `apt update && apt upgrade && apt autoremove` |
| **Log Inspection** | `journalctl -p 3 -n 50 --no-pager` |
| **Alert Logic** | `Alerts if error count > 5 in last 50 logs` |
| **Menu Interface** | CLI loop with `case branching` and `tee output` |
| **Supported OS** | Linux distributions using systemd and apt |
| **Privileges** | Normal user for backups; `sudo` required for updates and log access |
---
## Project Structure
```bash
System_Maintenance_Suite/
├── backup.sh
├── update.sh
├── log_monitor.sh
├── main_controller.sh
├── images/
└── maint_logs/
    ├── backup.log
    ├── update.log
    ├── log_monitor.log
    └── maintenance_suite.log
```
- All logs are auto-generated in `~/maint_logs/` after first execution.
---
## Usage Instructions
### 1. Clone or copy the project:
```bash
cd ~
mkdir System_Maintenance_Suite
```
### 2. Make all scripts executable:
```bash
chmod +x *.sh
```
### 3. Run the main controller:
```bash
./main_controller.sh
```
### 4. Follow on-screen options:
- Select an option (1-4) and press enter.
### 5. View Logs
```bash
ls ~/maint_logs/
cat ~/maint_logs/backup.log

```
---
## Example Output:

---
## Error Handling and Logging Architecture
- Each script starts with:
```bash
set -euo pipefail
trap 'echo "[ERROR] <script_name> failed at $(date)" >> $LOG_FILE; exit 1' ERR
```
- This ensures:
    - Immediate termination on failure.
    - Logging of the exact timestamp of failure.
    - No silent or partial execution.
- Unified Logging System:
```bash
~System_Maintenance_Suite/maint_logs/
├── backup.log
├── update.log
├── log_monitor.log
└── maintenance_suite.log

```

## Notes
- Ensure you have **sufficient disk space** before running backup.
- `update.sh` requires **sudo** privileges.
- Logs may contain sensitive information - avoid sharing outputs.
- Tested on **Kali Linux (XFCE)**.

---
## Author  
**Saswat Kumar Pandey**  
**Registration Number: 2241016143**  
**Wipro Batch: 11**  
**Computer Science Engineering with Cybersecurity Specialization**  
**Institute of Technical Education And Research (ITER)**  
**Siksha 'O' Anusandhan University (SOA)**