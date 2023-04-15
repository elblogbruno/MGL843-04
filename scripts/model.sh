# This script is used to generate the models for all the projects
# This script MUST be ran from the FamixTypeScriptImporter directory
# This script MUST be ran in a git bash terminal otherwise Moose will not be able to load the models correctly

# check if --default is passed as an argument
if [ "$1" = "--default" ]; then
    # set the default values
    subjects_path="repos"
    models_path="models"
else
    # input the path of the directory containing the projects
    echo "Enter the path of the directory containing the projects: (default: repos): "
    read subjects_path

    # input the path of the directory where the models will be generated
    echo "Enter the path of the directory where the models will be generated: (default: models): "
    read models_path

    # if the path is empty, set it to the default value
    if [ -z "$subjects_path" ]; then
        subjects_path="repos"
    fi

    # if the path is empty, set it to the default value
    if [ -z "$models_path" ]; then
        models_path="models"
    fi
fi

# check if the directory exists
if [ ! -d "$subjects_path" ]; then
    echo "The directory does not exist"
    mkdir $subjects_path
fi

# check if the directory exists
if [ ! -d "$models_path" ]; then
    echo "The directory does not exist"
    mkdir $models_path
fi

# install the dependencies

git clone https://github.com/Arezoo-Nasr/FamixTypeScriptImporter.git

cd FamixTypeScriptImporter

npm install

npm install -g ts-node

cd ..

# check if --multi is passed as an argument alone or with --default

if [ "$1" = "--multi" ] || [ "$2" = "--multi" ]; then
    echo "Generating models in multiple threads ..."

    # get number of cpu cores on the machine
    cores=$(nproc)
    cores=$((cores - 1))

    # define a function to generate the project model using ts-node
    generate_model() {
        dir="$1"
        subjects_path="$2"
        models_path="$3"
        name=$(basename "$dir")
        echo "Processing thread $name $subjects_path ..."
        ts-node FamixTypeScriptImporter/src/ts2famix-cli.ts -i "$subjects_path/$name/**/*.ts" -o "$models_path/$name-model".json >/dev/null 2>&1
    }

    start_time=$(date +%s)

    # run the function in parallel
    export -f generate_model
    # find $subjects_path -maxdepth 1 -mindepth 1 -type d -print0 | xargs -0 -n 1 -P $cores bash -c 'generate_model "$@"' _ {}

    # use parallel to run the function in parallel with all the projects. Send the subjects_path as an argument to the function
    find $subjects_path -maxdepth 1 -mindepth 1 -type d -print0 | parallel -0 -n 1 -P $cores generate_model {} $subjects_path  $models_path
    end_time=$(date +%s)

    echo "Total time: $((end_time - start_time)) seconds"
    exit
fi

echo "Generating models in single thread ..."

start_time=$(date +%s)

# for each project generate the model using ts-node
for dir in $subjects_path/*; do
    # if the directory is a directory
    if [ -d "$dir" ]; then
        # get the name of the directory
        name=$(basename "$dir")

        echo "Processing $name ..."
        # generate theproject model using ts-node
        ts-node FamixTypeScriptImporter/src/ts2famix-cli.ts -i "$subjects_path/$name/**/*.ts" -o "$models_path/$name-model".json >/dev/null 2>&1
    fi
done

end_time=$(date +%s)

echo "Total time: $((end_time - start_time)) seconds"
