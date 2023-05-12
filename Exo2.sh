#!/bin/bash

if [ "$#" -ne 1 ];then
  echo "trop de parametres ou pas assez de parametres"
  exit 1
fi

if [ ! -d "$1" ];then
  echo "il faut un rep en parametres"
  exit 1
fi

nombre=$(find "$1" -type f -perm /u+x | wc -l)

echo "Le repertoire $1 contient $nombre fichier executables par $USER"
