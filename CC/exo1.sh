#!/bin/bash

mkdir -p $HOME/Images/vendredi

if [ $(date +%A) == "vendredi" ]; then
    filename="ecran-$(date +%Y%m%d-%H%M%S).png"
    path="$HOME/Images/vendredi/$filename"
    gnome-screenshot -f $path
else
    echo "Ce n'est pas vendredi"
fi
