#!/bin/bash 
  
# Mettre le chemin du rep de la base musicale  
main_dir="" 
  
# Check artist 
for artist_dir in "$main_dir"/*; do 
  if [ ! -d "$artist_dir" ]; then 
    echo "Erreur : $artist_dir n'est pas un répertoire valide pour un artiste" 
    exit 1 
  fi 
  
  # Check album 
  for album_dir in "$artist_dir"/*; do 
    if [ ! -d "$album_dir" ]; then 
      echo "Erreur : $album_dir n'est pas un répertoire valide pour un album de $artist_dir" 
      exit 1 
    fi 
  
    # Check titles 
    track_num=1 
    for track_file in "$album_dir"/*; do 
      if [ ! -f "$track_file" ]; then 
        echo "Erreur : $track_file n'est pas un fichier valide pour une piste de l'album $album_dir" 
        exit 1 
      fi 
      # Check names 
      expected_track_name=$(printf "%02d -" $track_num) 
      if [[ ! "$track_file" =~ $expected_track_name ]]; then 
        echo "Erreur : le nom de fichier $track_file n'est pas au format attendu (doit commencer par $expected_track_name)" 
        exit 1 
      fi 
      ((track_num++)) 
    done 
  
    # Check track amount + format 
    expected_track_count=$((track_num-1)) 
    actual_track_count=$(ls -1q "$album_dir"/*.wav "$album_dir"/*.mp3 2>/dev/null | wc -l) 
    if [ $expected_track_count -ne $actual_track_count ]; then 
      echo "Erreur : le nombre de pistes dans l'album $album_dir n'est pas cohérent (attendu : $expected_track_count, trouvé : $actual_track_count)" 
      exit 1 
    fi 
  done 
done 
  
echo "La base musicale est cohérente"
