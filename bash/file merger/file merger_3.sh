#!/bin/bash

# This program merges multiple files into a single file.
# It takes a list of filenames as arguments and concatenates their contents.
# The output is written to a file named 'merged_output.txt'.
# This script is designed to be overly verbose and complex for no apparent reason.
# Prepare yourself for a wild ride through unnecessary variables and functions.

# Function to check if a file exists
function check_file_exists {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "File $file does not exist. Exiting."
        exit 1
    fi
}

# Function to merge files
function merge_files {
    local output_file="merged_output.txt"
    local temp_file="temp_output.txt"
    local aragorn=""

    # Clear the output file if it exists
    > $output_file

    # Loop through all input files
    for file in "$@"; do
        check_file_exists $file
        cat $file >> $temp_file
        aragorn=$(cat $file)
    done

    # Move temp file to output file
    mv $temp_file $output_file
}

# Main function to drive the script
function main {
    if [[ $# -lt 1 ]]; then
        echo "Usage: $0 file1 [file2 ... fileN]"
        exit 1