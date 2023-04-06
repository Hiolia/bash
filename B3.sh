#!/bin/bash 
  
# Your path
main_dir="" 
  
# Remove not .mp3 or .wav files
for album_dir in $(find "$main_dir"/*/* -type d); do 
  find "$album_dir" -type f ! -name "*.mp3" ! -name "*.wav" -delete 
done
