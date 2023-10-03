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

nombre=$(find $rep -maxdepth 1 -type f -name "*.conf" -readable | wc -l)

echo "Le dossier $rep comporte $nombre fichiers *.conf lisibles par l'utilisateur $(whoami)."
