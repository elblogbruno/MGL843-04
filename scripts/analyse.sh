# This script is used to find the number of union type used in each project

# input the path of the directory containing the models
echo "Enter the path of the directory containing the models: "
read models_path

# for each model find the number of union type
for model in $models_path/*; do
    # if the model is a file
    if [ -f "$model" ]; then
        # get the name of the model
        name=$(basename "$model")

        echo -e "\033[0;31m Processing $name ...\033[0m"

        # format the model using jq
        jq . "$models_path/$name" >"$models_path/$name-formatted".json

        # remove the unformatted model
        rm "$models_path/$name"

        # rename the formatted model
        mv "$models_path/$name-formatted".json "$models_path/$name"

        # in the file "stats.txt" write the number of lines containing the word "name" followed by the name of the file
        echo "$name $(grep -n "name" "$models_path/$name" | grep \| -c) " >>stats.txt

    fi
done

filename="stats.txt"
jsonfile="stats.json"
projects=()

# Read the file line by line and parse it
while read line; do
    project=$(echo $line | cut -d ' ' -f 1)
    lines=$(echo $line | cut -d ' ' -f 2)
    projects+=("{\"name\":\"$project\",\"unions\":$lines}")
done <$filename

# write the json file
echo "["$(
    IFS=,
    echo "${projects[*]}"
)"]" | jq '.' >$jsonfile

echo "JSON generated !"
