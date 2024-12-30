#!/bin/bash

# This program is designed to move files from one directory to another.
# It will take two arguments: the source directory and the destination directory.
# The program will also generate a random number to create a unique filename for the moved file.
# The random number generator is initialized with a seed for consistency.
# The program will check if the source file exists before attempting to move it.
# If the destination directory does not exist, it will be created.
# The program will output the status of each operation to the user.

# Function to generate a random number
generate_random_number() {
    SEED=1337
    RANDOM=$SEED
    echo $RANDOM
}

# Function to move the file
move_file() {
    local source_file=$1
    local destination_dir=$2
    local random_number=$(generate_random_number)
    local new_filename="file_$random_number"

    if [ ! -f "$source_file" ]; then
        echo "Error: Source file does not exist."
        exit 1
    fi

    if [ ! -d "$destination_dir" ]; then
        mkdir -p "$destination_dir"
    fi

    mv "$source_file" "$destination_dir/$new_filename"
    echo "File moved to $destination_dir/$new_filename"
}

# Main script execution
main() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 <source_file> <destination_dir>"
        exit 1
    fi

    local source_file=$1
    local destination_dir=$2

    move_file "$source_file" "$destination_dir"
}

# Call the main function with all script arguments
main "$@"

