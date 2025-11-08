#!/bin/bash
# Main Controller Script

set -euo pipefail

LOG_DIR="$HOME/System_Maintenance_Suite/maint_logs"
LOG_FILE="$LOG_DIR/maintenance_suite.log"
mkdir -p "$LOG_DIR"

while true; do
    clear
    echo "==== System Maintenance Suite ===="
    echo "1. Run Backup"
    echo "2. Update System"
    echo "3. Monitor Logs"
    echo "4. Exit"
    echo "=================================="
    read -p "Enter your choice [1-4]: " choice

    case $choice in
        1)
            echo "[INFO] Running Backup Script..." | tee -a "$LOG_FILE"
            bash backup.sh
            ;;
        2)
            echo "[INFO] Running System Update..." | tee -a "$LOG_FILE"
            bash update.sh
            ;;
        3)
            echo "[INFO] Running Log Monitor..." | tee -a "$LOG_FILE"
            bash log_monitor.sh
            ;;
        4)
            echo "[INFO] Exiting Maintenance Suite at $(date)" | tee -a "$LOG_FILE"
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice!" | tee -a "$LOG_FILE"
            ;;
    esac
    read -p "Press Enter to continue..."
done
