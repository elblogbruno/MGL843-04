echo "This script will run all the scripts in the right order with the default values"
echo "It will download the projects, generate the models, analyse the models and select the projects"
echo "It will also move the selected projects to the selected folder"

echo "It is recommended to run this script in a git bash terminal and as well run every script separately to see the output"

python repos.py 

./download.sh --default

# check if --multi is passed as an argument alone or with --default
if [ "$1" = "--multi" ] || [ "$1" = "--default --multi" ]; then
    echo "Generating models in multiple threads ..."
    
    ./model.sh --default --multi
else
    echo "Generating models in a single thread ..."
    
    # run the model script in a single thread
    ./model.sh --default
fi


./analyse.sh --default

python selection.py

./move.sh --default
