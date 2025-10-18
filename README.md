<<<<<<< HEAD
# 🩺 Linux System Health Monitor (Bash)

A lightweight Bash script to monitor CPU usage, memory consumption, disk space, and running processes on a Linux system. Alerts are logged to the console and a log file when thresholds are exceeded.

## 📦 Features

- ✅ CPU usage monitoring
- ✅ Memory usage tracking
- ✅ Disk space checks
- ✅ Process count alerts
- ✅ Console + log file alerts
- ✅ Cron-ready for automation

## 🚀 Getting Started
./health_monitor.sh

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


=======
# Cow wisdom web server

## Prerequisites

```
sudo apt install fortune-mod cowsay -y
```

## How to use?

1. Run `./wisecow.sh`
2. Point the browser to server port (default 4499)

## 📜 What is wisecow?

**wisecow** is a whimsical microservice that serves random fortunes wrapped in a cowsay bubble — all over HTTP. It’s a fun, containerized project that demonstrates:

- 🐳 Docker image creation with runtime dependencies
- ☸️ Kubernetes deployment with Ingress routing
- 🧪 Shell scripting for lightweight HTTP servers
- 🧱 DevOps best practices for local development and testing

---

## 🚀 Quickstart (Minikube)
minikube start --driver=docker
minikube addons enable ingress

Point Docker to Minikube
eval $(minikube docker-env)

Build the Docker image
docker build -t wisecow:founderfix .

Deploy to Kubernetes
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml

What to expect?
![Architecture Diagram](src/wisecow.png)

🧱 Project Structure
wisecow-k8s-deployment/
├── Dockerfile              # Builds the cowsay server image
├── wisecow/
│   └── wisecow.sh          # Bash-based HTTP server with cowsay + fortune
├── k8s/
│   ├── deployment.yaml     # Kubernetes Deployment
│   ├── service.yaml        # ClusterIP Service

│   └── ingress.yaml        # Ingress for domain-style routing
>>>>>>> 3571ecb985c56640c744f768abcdcd8b24542115

