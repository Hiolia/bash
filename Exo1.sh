#!/bin/bash

heure=$(date +%H%M%S)
datededans=$(date)
fic="fichier-$heure.txt"
echo $datededans > $fic
touch $fic
