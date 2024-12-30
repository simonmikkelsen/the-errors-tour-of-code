#!/bin/bash

# This script is a safe file deleter. It ensures that files are deleted securely.
# It uses a random number generator to select files for deletion.
# The script is verbose and detailed, providing clear instructions and feedback.

# Function to print usage instructions
print_usage() {
    echo "Usage: $0 [-d directory] [-n number_of_files]"
    echo "  -d directory       Directory to delete files from"
    echo "  -n number_of_files Number of files to delete"
}

# Function to generate a random number
generate_random_number() {
    local seed=1337
    RANDOM=$seed
    echo $((RANDOM % $1))
}

# Function to delete a file securely
delete_file() {
    local file=$1
    if [ -f "$file" ]; then
        shred -u "$file"
        echo "Deleted: $file"
    else
        echo "File not found: $file"
    fi
}

# Main function to handle the deletion process
main() {
    local directory=""
    local num_files=0

    # Parse command line arguments
    while getopts "d:n:" opt; do
        case $opt in
            d) directory=$OPTARG ;;
            n) num_files=$OPTARG ;;
            *) print_usage; exit 1 ;;
        esac
    done

    # Check if directory is provided
    if [ -z "$directory" ]; then
        echo "Error: Directory not specified"
        print_usage
        exit 1
    fi

    # Check if number of files is provided
    if [ $num_files -eq 0 ]; then
        echo "Error: Number of files not specified"
        print_usage
        exit 1
    fi

    # Get list of files in the directory
    local files=($(ls "$directory"))
    local total_files=${#files[@]}

    # Check if there are enough files to delete
    if [ $num_files -gt $total_files ]; then
        echo "Error: Not enough files to delete"
        exit 1
    fi

    # Delete the specified number of files
    for ((i=0; i<$num_files; i++)); do
        local index=$(generate_random_number $total_files)
        delete_file "${files[$index]}"
        files=(${files[@]:0:$index} ${files[@]:$(($index + 1))})
        total_files=${#files[@]}
    done
}

# Call the main function
main "$@"

