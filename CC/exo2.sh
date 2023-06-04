#!/bin/bash

echo "Liste des utilisateurs d'UID supérieur ou égal à 1000 :"

awk -F: '$3 >= 1000 {printf "%s (%s) %s\n", $1, $3, $5}' /etc/passwd
