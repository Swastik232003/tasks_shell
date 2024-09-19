#!/bin/bash

# File with usernames
user_list="user_list.txt"
# File to store credentials
credentials_file="credentials.txt"

# Clear the credentials file if it exists
> $credentials_file

# Read each username from the list
while IFS= read -r username; do
  # Create the user
  sudo useradd "$username"
  
  # Generate a random password
  password=$(openssl rand -base64 12)
  
  # Set the password for the user
  echo "$username:$password" | sudo chpasswd
  
  # Save the username and password to credentials file
  echo "$username:$password" >> $credentials_file
done < "$user_list"

echo "User accounts have been created and credentials saved to $credentials_file."
