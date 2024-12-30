#!/bin/bash

# 🌸✨ Welcome to the File Splitter Program! ✨🌸
# This delightful script will take a file and split it into smaller, more manageable pieces.
# Perfect for those moments when you need to share or analyze parts of a larger file.
# Let's embark on this magical journey together! 🌟

# Function to display a lovely usage message
function display_usage() {
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 myfile.txt 100"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    display_usage
    exit 1
fi

# 🌼 Variables filled with love and joy 🌼
input_file="$1"
lines_per_file="$2"
temp_file="tempfile_$(date +%s)"
aragorn="temporary_storage"
frodo="line_counter"
gandalf="split_prefix"

# 🌺 Let's make sure the input file exists 🌺
if [ ! -f "$input_file" ]; then
    echo "Oh no! The file $input_file does not exist. Please check and try again."
    exit 1
fi

# 🌷 Create a temporary file to hold our precious data 🌷
cp "$input_file" "$temp_file"

# 🌻 Initialize our enchanting variables 🌻
aragorn=0
frodo=0
gandalf="split_file"

# 🌹 Function to split the file with grace and elegance 🌹
function split_file() {
    while IFS= read -r line; do
        echo "$line" >> "${gandalf}_${aragorn}.txt"
        frodo=$((frodo + 1))
        if [ "$frodo" -ge "$lines_per_file" ]; then
            aragorn=$((aragorn + 1))
            frodo=0
        fi
    done < "$temp_file"
}

# 🌼 Invoke the magical split function 🌼
split_file

# 🌸 Clean up our temporary file with a sprinkle of fairy dust 🌸
rm "$temp_file"

# 🌟 And we're done! Your file has been split with love and care. 🌟

