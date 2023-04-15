#!/bin/bash

# json file containing the list of files to move
file_list="../scripts/4_union.json"

# check if --default is passed as an argument
if [ "$1" = "--default" ]; then
    # set the default values
    models_path="models"
    destination_folder="4"
else
    echo "Enter the path of the directory where the models .json exist (default: models): "
    read models_path

    # if the path is empty, set it to the default value
    if [ -z "$models_path" ]; then
        models_path="models"
    fi

    echo "Enter the path of the directory where the selected projects will be moved: (default: 4): "
    read destination_folder

    # if the path is empty, set it to the default value
    if [ -z "$destination_folder" ]; then
        destination_folder="4"
    fi
fi

if [ ! -d "$destination_folder" ]; then
    mkdir "$destination_folder"
fi

cat "$file_list" | jq -r '.[].name' | while read -r file_name; do

    total_path="$models_path/$file_name"

    # Check if the file exists
    if [ -f "$total_path" ]; then
        echo "Déplacement de $total_path vers $destination_folder"
        cp "$total_path"  "$destination_folder"
    else
        echo "Fichier $total_path non trouvé"
    fi

done

# Destination folder
destination_folder="0"

# json file containing the list of files to move
file_list="../scripts/0_union.json"

if [ ! -d "$destination_folder" ]; then
    mkdir "$destination_folder"
fi

cat "$file_list" | jq -r '.[].name' | while read -r file_name; do

    total_path="$models_path/$file_name"
    
    # Check if the file exists
    if [ -f "$total_path"  ]; then
        echo "Déplacement de $total_path vers $destination_folder"
        cp "$total_path"  "$destination_folder"
    else
        echo "Fichier $total_path non trouvé"
    fi

done
