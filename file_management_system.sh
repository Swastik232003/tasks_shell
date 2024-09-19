#!/bin/bash
backup_dir="$root/imp/backup"
mkdir -p "$backup_dir"
current_date=$(date +"%Y-%m-%d_%H-%M%S")
for file in *.txt; do
cp "$file" "$backup_dir/${file%.txt}_$current_date.txt"
done

echo "all .txt files have been backed up with current data and time append"
