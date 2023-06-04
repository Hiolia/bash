#!/bin/bash

if [ $# -ne 1 ]; then
  echo "il faut mettre le chemin d'un repertoire en parametre"
  exit 1
fi

rep=$1

if [ ! -d $rep ]; then
  echo "$rep n'est pas un dossier valide."
  exit 1
fi

nombre=0

for fichier in $rep/*.conf; do
  if [ -r $fichier ]; then
    ((nombre++))
  fi
done

echo "Le dossier $rep comporte $nombre fichiers *.conf lisibles par l'utilisateur $(whoami)."
