#!/bin/bash

# Your path 
main_dir=""

# Delete files in main
find "$main_dir" -maxdepth 1 -type f ! -name "*.mp3" ! -name "*.wav" -delete 

# Delete files in artist
for artist_dir in "$main_dir"/*; do 
  if [ ! -d "$artist_dir" ]; then 
    continue 
  fi 
  
  find "$artist_dir" -maxdepth 1 -type f ! -name "*.mp3" ! -name "*.wav" -delete 
done
