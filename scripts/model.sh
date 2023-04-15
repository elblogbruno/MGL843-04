# This script is used to generate the models for all the projects
# This script MUST be ran from the FamixTypeScriptImporter directory
# This script MUST be ran in a git bash terminal otherwise Moose will not be able to load the models correctly

# input the path of the directory containing the projects
echo "Enter the path of the directory containing the projects: "
read subjects_path

# input the path of the directory where the models will be generated
echo "Enter the path of the directory where the models will be generated: "
read models_path

# for each project generate the model using ts-node
for dir in $subjects_path/*; do
    # if the directory is a directory
    if [ -d "$dir" ]; then
        # get the name of the directory
        name=$(basename "$dir")

        echo "Processing $name ..."
        # generate theproject model using ts-node
        ts-node src/ts2famix-cli.ts -i "$subjects_path/$name/**/*.ts" -o "$models_path/$name-model".json >/dev/null 2>&1
    fi
done
