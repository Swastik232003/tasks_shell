#!/bin/bash

# Get the text file from user input
read -p "Enter the text file name: " file_name

# Check if the file exists
if [[ -f "$file_name" ]]; then
  # Count lines, words, and characters
  lines=$(wc -l < "$file_name")
  words=$(wc -w < "$file_name")
  characters=$(wc -m < "$file_name")
  
  echo "Lines: $lines"
  echo "Words: $words"
  echo "Characters: $characters"
  
  # Find the longest word
  longest_word=$(awk '{ for(i=1;i<=NF;i++) { if(length($i) > max) { max = length($i); word = $i } } } END { print word }' "$file_name")
  
  echo "Longest word: $longest_word"
else
  echo "File does not exist."
fi
