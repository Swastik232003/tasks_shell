#!/bin/bash

# Get CPU and Memory usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Check if CPU usage is above 80% or if memory is below 20%
cpu_threshold=80.0
mem_threshold=20.0

log_file="system_health.log"

echo "CPU Usage: $cpu_usage%" >> $log_file
echo "Memory Usage: $mem_usage%" >> $log_file

if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )); then
  echo "Warning: CPU usage is above 80%" >> $log_file
fi

if (( $(echo "$mem_usage < $mem_threshold" | bc -l) )); then
  echo "Warning: Available memory is below 20%" >> $log_file
fi
