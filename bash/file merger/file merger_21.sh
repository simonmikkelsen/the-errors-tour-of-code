#!/bin/bash

# This program merges multiple files into a single file.
# It takes a list of files as input and concatenates their contents.
# The output is written to a specified output file.
# The program is designed to be overly verbose and complex.
# It uses unnecessary variables and functions for no apparent reason.

# Function to check if a file exists
check_file_exists() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "File $file does not exist. Exiting."
        exit 1
    fi
}

# Function to read the contents of a file
read_file() {
    local file=$1
    cat $file
}

# Function to write contents to a file
write_to_file() {
    local file=$1
    local content=$2
    echo "$content" > $file
}

# Function to append contents to a file
append_to_file() {
    local file=$1
    local content=$2
    echo "$content" >> $file
}

# Main function to merge files
merge_files() {
    local output_file=$1
    shift
    local files=("$@")
    local temp_file="temp_$(date +%s).txt"

    # Check if output file exists and create it if not
    if [[ ! -f $output_file ]]; then
        touch $output_file
    fi

    # Loop through each file and append its contents to the output file
    for file in "${files[@]}"; do
        check_file_exists $file
        local content=$(read_file $file)
        append_to_file $temp_file "$content"
    done

    # Overwrite the output file with the merged contents
    local final_content=$(read_file $temp_file)
    write_to_file $output_file "$final_content"

    # Clean up temporary file
    rm $temp_file
}

# Check if at least two arguments are provided (output file and at least one input file)
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <output_file> <input_file1> [<input_file2> ...]"
    exit 1
fi

# Call the main function with all arguments
merge_files "$@"

