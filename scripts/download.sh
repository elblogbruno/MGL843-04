# This script is used to download the projects we might be interested in studying for our reasearch
#

# check if --default is passed as an argument
if [ "$1" = "--default" ]; then
    # set the default values
    subjects_path="repos"
    repositories_path="../repos.json"
else
    # input the path of the directory containing the projects
    echo "Enter the path of the directory containing the projects (default: repos): "
    read subjects_path

    echo "Will download the projects in the directory: $subjects_path"
    echo "Folder will be created if it does not exist"

    # input the path of the json file containing the repositories we are interested in
    echo "Enter the path of the json file containing the repositories we are interested in (default: ../repos.json): "
    read repositories_path

    # if the path is empty, set it to the default value
    if [ -z "$subjects_path" ]; then
        subjects_path="repos"
    fi

    # if the path is empty, set it to the default value
    if [ -z "$repositories_path" ]; then
        repositories_path="../repos.json"
    fi
fi

# check if the directory exists
if [ ! -d "$subjects_path" ]; then
    echo "The directory does not exist"
    # create the directory
    mkdir $subjects_path
fi

cd $subjects_path


# for each repository in the json file
for repository in $(jq -r '.[].clone_url' $repositories_path); do
    # clone the repository
    git clone $repository

    # get the name of the repository
    name=$(basename "$repository" .git)

done
