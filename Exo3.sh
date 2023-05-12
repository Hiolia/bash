#!/bin/bash

if [ ! -d "$HOME/util" ]; then
  mkdir "$HOME/util"
else
  echo "Le repertoire $HOME/util existe deja."
  exit 1
fi

users=$(cut -d: -f1 /etc/passwd)

for user in $users; do
  ficher="$HOME/util/$user"
  echo "$(id -u $user)" > "$fichier"
  echo "$(getent passwd $user | cut -d: -f7)" >> "$fichier"
done
