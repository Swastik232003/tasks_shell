#!/bin/bash

# File with package names
package_list="packages.txt"

# Log file
log_file="install_log.txt"

# Read each package name from the list
while IFS= read -r package; do
  # Try to install the package
  if sudo apt-get install -y "$package" >> $log_file 2>&1; then
    echo "$package installed successfully" >> $log_file
  else
    echo "Failed to install $package" >> $log_file
  fi
done < "$package_list"

echo "Software installation completed. Check $log_file for details."
