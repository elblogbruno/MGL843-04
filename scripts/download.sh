# This script is used to download the projects we might be interested in studying for our reasearch
#

# input the path of the directory containing the projects
echo "Enter the path of the directory containing the projects: "
read subjects_path

# input the path of the json file containing the repositories we are interested in
echo "Enter the path of the json file containing the repositories we are interested in: "
read repositories_path

cd $subjects_path

# for each repository in the json file
for repository in $(jq -r '.[].clone_url' $repositories_path); do
    # clone the repository
    git clone $repository

    # get the name of the repository
    name=$(basename "$repository" .git)

done
