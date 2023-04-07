#!/bin/bash

main_dir=base


function artist_list {
  echo "List of artists and album count:"
  for artist_dir in "$main_dir"/*; do
    if [ ! -d "$artist_dir" ]; then
      continue
    fi
    artist=$(basename "$artist_dir")
    album_count=$(find "$artist_dir"/* -maxdepth 0 -type d | wc -l)
    echo "$artist ($album_count albums)"
  done
  echo ""
}


function album_list {
  echo "List of albums and song count for $1:"
  artist_dir="$main_dir/$1"
  for album_dir in "$artist_dir"/*; do
    if [ ! -d "$album_dir" ]; then
      continue
    fi
    album=$(basename "$album_dir")
    song_count=$(find "$album_dir"/* -maxdepth 0 -type f | wc -l)
    mp3_count=$(find "$album_dir"/* -maxdepth 0 -type f -name "*.mp3" | wc -l)
    wav_count=$(find "$album_dir"/* -maxdepth 0 -type f -name "*.wav" | wc -l)
    echo "$album ($song_count songs, $mp3_count in mp3 format, $wav_count in wav format)"
  done
  echo ""
}

function search_artist {
  read -p "Enter artist name: " search_name
  echo "Artists found with '$search_name' in :"
  for artist_dir in "$main_dir"/*; do
    if [ ! -d "$artist_dir" ]; then
      continue
    fi
    artist=$(basename "$artist_dir")
    if [[ "$artist" == *"$search_name"* ]]; then
      echo "$artist"
    fi
  done
  echo ""
}

function search_song {
  read -p "Enter song name: " search_name
  echo "Songs found with '$search_name' in :"
  for artist_dir in "$main_dir"/*; do
    if [ ! -d "$artist_dir" ]; then
      continue
    fi
    for album_dir in "$artist_dir"/*; do
      if [ ! -d "$album_dir" ]; then
        continue
      fi
      for song_file in "$album_dir"/*; do
        if [ ! -f "$song_file" ]; then
          continue
        fi
        song_name=$(basename "$song_file")
        if [[ "$song_name" == *"$search_name"* ]]; then
          artist=$(basename "$artist_dir")
          album=$(basename "$album_dir")
          echo "$song_name by $artist ($album)"
        fi
      done
    done
  done
  echo ""
}

while true; do
  echo "Menu"
  echo "-------------------"
  echo "1. Display list of all artists and album count"
  echo "2. Display list of albums and song count for a given artist"
  echo "3. Search for artists by name"
  echo "4. Search for songs by name"
  echo "5. Exit"
  read -p "Enter your choice: " choice

case $choice in
    1)
      artist_list
      ;;
    2)
      read -p "Enter artist name: " artist_name
      album_list "$artist_name"
      ;;
    3)
      search_artist
      ;;
    4)
      search_song
      ;;
    5)
      exit 0
esac
done

