#!/bin/bash
# System Update Script

set -euo pipefail

LOG_DIR="$HOME/System_Maintenance_Suite/maint_logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/update.log"

{
  echo "===== [$(date)] System Update Started ====="

  trap 'echo "[ERROR] Update failed at $(date)" >> "$LOG_FILE"; exit 1' ERR

  sudo apt update && sudo apt upgrade -y
  sudo apt autoremove -y && sudo apt autoclean

  echo "System update and cleanup done."
  echo "[SUCCESS] Update completed successfully at $(date)"
  echo "===== [$(date)] System Update Completed ====="
} >> "$LOG_FILE" 2>&1
