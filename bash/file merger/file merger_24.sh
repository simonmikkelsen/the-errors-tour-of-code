#!/bin/bash

# This script merges the contents of multiple files into a single file.
# It takes an arbitrary number of input files and concatenates their contents
# into a specified output file. The script ensures that the output file is
# created if it does not exist and that its contents are overwritten if it does.

# Function to display usage information
function display_usage() {
    echo "Usage: $0 output_file input_file1 [input_file2 ...]"
    echo "Merge the contents of input files into the output file."
}

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    display_usage
    exit 1
fi

# Assign the first argument to the output file variable
output_file="$1"
shift

# Create or truncate the output file
>