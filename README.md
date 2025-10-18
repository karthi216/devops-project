🗂️ Automated Backup Solution

This project provides a Bash-based automated backup solution using rsync to synchronize files and directories between local and remote systems. It helps automate backups while maintaining detailed logs and reports for monitoring and troubleshooting.

🚀 Features

Automated backup of a local directory to a remote server.

Uses rsync for efficient file transfer and synchronization.

Generates timestamped log files and backup reports.

Provides success/failure reporting after each backup execution.

Easy to configure and customize via environment variables.

🛠️ Prerequisites

Before using this script, ensure you have:

Linux or macOS environment (or WSL on Windows).

rsync installed on both local and remote systems.

SSH access to the remote server.

Sufficient permissions to read/write in the source and log directories.

⚙️ Configuration

Edit the following variables inside backup.sh before running the script:
# === CONFIGURATION ===
SOURCE_DIR="/path/to/source"              # Directory to back up
REMOTE_USER="your_user"                   # Remote server username
REMOTE_HOST="your.remote.server.com"      # Remote server address
REMOTE_DIR="/path/to/remote/backup"       # Remote backup destination
LOG_FILE="/var/log/backup.log"            # Log file location
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")    # Timestamp for reports
REPORT_FILE="/tmp/backup_report_$TIMESTAMP.txt"

1. Make the script executable
chmod +x backup.sh

2. Run the script
./backup.sh

If you encounter permission errors (e.g., writing to /var/log), use:
sudo ./backup.sh

🧰 Script Breakdown
Section	Description
Configuration	Defines backup source, destination, and log paths
Backup Execution	Uses rsync for syncing files

Reporting	Displays success or failure with detailed logging
