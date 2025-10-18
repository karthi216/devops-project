#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90
PROCESS_THRESHOLD=300
LOG_FILE="/var/log/system_health.log"

# Function to log alerts
log_alert() {
    echo "[ALERT] $1"
    echo "$(date): [ALERT] $1" >> "$LOG_FILE"
}

# Check CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
cpu_usage_int=${cpu_usage%.*}
if [ "$cpu_usage_int" -gt "$CPU_THRESHOLD" ]; then
    log_alert "High CPU usage: $cpu_usage%"
fi

# Check Memory usage
memory_usage=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
if [ "$memory_usage" -gt "$MEMORY_THRESHOLD" ]; then
    log_alert "High memory usage: $memory_usage%"
fi

# Check Disk usage
disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
    log_alert "Low disk space: $disk_usage% used"
fi

# Check number of running processes
process_count=$(ps aux --no-heading | wc -l)
if [ "$process_count" -gt "$PROCESS_THRESHOLD" ]; then
    log_alert "Too many running processes: $process_count"
fi

# Summary output
echo "System Health Check @ $(date)"
echo "CPU Usage: $cpu_usage%"
echo "Memory Usage: $memory_usage%"
echo "Disk Usage: $disk_usage%"
echo "Running Processes: $process_count"