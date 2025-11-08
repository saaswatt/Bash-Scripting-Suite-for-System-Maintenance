#!/bin/bash
# Log Monitoring Script

set -euo pipefail

LOG_DIR="$HOME/System_Maintenance_Suite/maint_logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/log_monitor.log"

{
  echo "===== [$(date)] Log Monitoring Started ====="

  TMP_LOG="/tmp/sys_errors.txt"
  sudo journalctl -p 3 -n 50 --no-pager > "$TMP_LOG"

  ERROR_COUNT=$(grep -ci "error" "$TMP_LOG" || true)

  echo "Recent system errors/warnings:"
  tail -n 10 "$TMP_LOG"

  # Simple alert condition
  if [ "$ERROR_COUNT" -gt 5 ]; then
      echo "⚠️ ALERT: High number of errors detected ($ERROR_COUNT)."
      echo "[ALERT] Detected $ERROR_COUNT critical errors at $(date)"
  else
      echo "System status: Normal (Errors: $ERROR_COUNT)"
      echo "[OK] System stable with $ERROR_COUNT recent errors."
  fi

  echo "===== [$(date)] Log Monitoring Completed ====="
} >> "$LOG_FILE" 2>&1
