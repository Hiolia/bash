#!/bin/bash 
  
# Insert your path
main_dir="" 
  
# Check artist 
for artist_dir in "$main_dir"/*; do 
  if [ ! -d "$artist_dir" ]; then 
    echo "Error : $artist_dir is not a valid directory" 
    exit 1 
  fi 
  
  # Check album 
  for album_dir in "$artist_dir"/*; do 
    if [ ! -d "$album_dir" ]; then 
      echo "Error : $album_dir is not valid for $artist_dir" 
      exit 1 
    fi 
  
    # Check titles 
    track_num=1 
    for track_file in "$album_dir"/*; do 
      if [ ! -f "$track_file" ]; then 
        echo "Error : $track_file is not a valid file for the album $album_dir" 
        exit 1 
      fi 
      # Check names 
      expected_track_name=$(printf "%02d -" $track_num) 
      if [[ ! "$track_file" =~ $expected_track_name ]]; then 
        echo "Error : $track_file do not respect the expected name (must start by $expected_track_name)" 
        exit 1 
      fi 
      ((track_num++)) 
    done 
  
    # Check track amount + format 
    expected_track_count=$((track_num-1)) 
    actual_track_count=$(ls -1q "$album_dir"/*.wav "$album_dir"/*.mp3 2>/dev/null | wc -l) 
    if [ $expected_track_count -ne $actual_track_count ]; then 
      echo "Error : the amount of track in the album $album_dir is suspicious (expected : $expected_track_count, found : $actual_track_count)" 
      exit 1 
    fi 
  done 
done 
  
echo "Everything is alright"
