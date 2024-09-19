#!/bin/bash

# Ask user for the directory to backup
read -p "Enter the directory to backup: " dir_path

# Get current date
current_date=$(date +"%Y-%m-%d")

# Compress the directory into a .tar.gz file
backup_file="backup_$current_date.tar.gz"
tar -czvf "$backup_file" "$dir_path"

echo "Directory $dir_path has been compressed into $backup_file."
