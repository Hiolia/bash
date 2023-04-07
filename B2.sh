#!/bin/bash

main_dir=base

for album_dir in $(find "$main_dir"/*/* -type d); do
  for track_file in "$album_dir"/*; do
    if [ ! -f "$track_file" ]; then
      continue
    fi

    track_name=$(basename "$track_file")
    if [[ ! "$track_name" =~ ^[0-9]{2}\ .*$ ]]; then
      new_track_name=$(printf "%02d - %s" "${track_name:0:2}" "${track_name:3}")
      mv "$track_file" "$album_dir/$new_track_name"
    fi
  done
done


