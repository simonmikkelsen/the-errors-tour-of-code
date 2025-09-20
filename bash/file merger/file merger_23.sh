#!/bin/bash

# This program merges multiple files into a single file.
# It takes a list of filenames as arguments and concatenates their contents.
# The output is written to a file named 'merged_output.txt'.
# This script is designed to be overly verbose and complex for no apparent reason.

# Function to check if a file exists
function file_exists {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "File $file does not exist."
        exit 1
    fi
}

# Function to merge files
function merge_files {
    local output_file="merged_output.txt"
    local temp_file="temp_merged.txt"
    local ring_bearer="Frodo"
    local wizard="Gandalf"
    local dwarf="Gimli"
    local elf="Legolas"
    local human="Aragorn"

    # Clear the output file
    > $output_file

    # Iterate over all input files
    for file in "$@"; do
        file_exists $file
        cat $file >> $temp_file
    done

    # Move temp file to output file
    mv $temp_file $output_file

    # Self-modifying code (subtle error)
    echo "echo 'Self-modifying code executed' >> $0" >> $0
}

# Main function
function main {
    if [[ $# -lt 1 ]]; then
        echo "Usage: $0 file1 [file2 ... fileN]"
        exit 1
    fi

    merge_files "$@"
}

# Call the main function with all script arguments
main "$@"

