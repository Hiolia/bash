#!/bin/bash 
  
# Your path 
main_dir="" 
  
find "$main_dir" -type f ! -name "*.mp3" ! -name "*.wav" -delete 
find "$main_dir"/* -type f -delete 
for artist_dir in "$main_dir"/*; do 
  if [ ! -d "$artist_dir" ]; then 
    continue 
  fi 
  
  find "$artist_dir"/* -type f ! -name "*.mp3" ! -name "*.wav" -delete 
  find "$artist_dir"/* -type f -delete 
done
