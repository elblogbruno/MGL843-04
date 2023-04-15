#!/bin/bash

# json file containing the list of files to move
file_list="../scripts/4_union.json"

# Destination folder
destination_folder="4"

cat "$file_list" | jq -r '.[].name' | while read -r file_name; do

    # Check if the file exists
    if [ -f "$file_name" ]; then
        echo "Déplacement de $file_name vers $destination_folder"
        cp "$file_name" "$destination_folder"
    else
        echo "Fichier $file_name non trouvé"
    fi

done

# Destination folder
destination_folder="0"

cat "$file_list" | jq -r '.[].name' | while read -r file_name; do

    # Check if the file exists
    if [ -f "$file_name" ]; then
        echo "Déplacement de $file_name vers $destination_folder"
        cp "$file_name" "$destination_folder"
    else
        echo "Fichier $file_name non trouvé"
    fi

done
