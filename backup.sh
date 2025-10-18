#!/bin/bash

# === CONFIGURATION ===
SOURCE_DIR="/path/to/source"           # Directory to back up
REMOTE_USER="your_user"                # Remote server username
REMOTE_HOST="your.remote.server.com"  # Remote server address
REMOTE_DIR="/path/to/remote/backup"   # Remote backup destination
LOG_FILE="/var/log/backup.log"        # Log file location
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="/tmp/backup_report_$TIMESTAMP.txt"

# === BACKUP EXECUTION ===
echo "[$TIMESTAMP] Starting backup..." | tee -a "$LOG_FILE"

rsync -avz --delete "$SOURCE_DIR" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}" >> "$LOG_FILE" 2>&1
STATUS=$?

# === REPORTING ===
if [ $STATUS -eq 0 ]; then
    echo "[$TIMESTAMP] Backup SUCCESSFUL." | tee -a "$LOG_FILE" | tee "$REPORT_FILE"
else
    echo "[$TIMESTAMP] Backup FAILED with status code $STATUS." | tee -a "$LOG_FILE" | tee "$REPORT_FILE"
fi

# === OPTIONAL: EMAIL REPORT ===
# mail -s "Backup Report - $TIMESTAMP" you@example.com < "$REPORT_FILE"