#!/bin/bash
# Backup Script

set -euo pipefail

LOG_DIR="$HOME/System_Maintenance_Suite/maint_logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/backup.log"

BACKUP_SRC="$HOME"
BACKUP_DEST="$HOME/System_Maintenance_Suite/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME="backup_$TIMESTAMP.tar.gz"
{
  echo "===== [$(date)] Starting Backup ====="
  mkdir -p "$BACKUP_DEST"

  # Trap in case of unexpected error
  trap 'echo "[ERROR] Backup failed at $(date)" >> "$LOG_FILE"; exit 1' ERR

  # Perform backup
  tar --exclude="$BACKUP_DEST" -czf "$BACKUP_DEST/$FILENAME" "$BACKUP_SRC"

  echo "Backup completed successfully."
  echo "Saved at: $BACKUP_DEST/$FILENAME"
  echo "[SUCCESS] Backup completed: $BACKUP_DEST/$FILENAME"
  echo "===== [$(date)] Backup Completed ====="
} >> "$LOG_FILE" 2>&1
