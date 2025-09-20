#!/bin/bash

# list_merger.sh
# This script merges two lists of items provided as input files.
# The purpose of this script is to demonstrate how to handle file inputs,
# read their contents, merge them, and output the result to a new file.
# The script expects two input files and one output file as arguments.

# Function to check if a file exists and is readable
check_file() {
    if [[ ! -r "$1" ]]; then
        echo "Error: File '$1' does not exist or is not readable."
        exit 1
    fi
}

# Check if the correct number of arguments is provided
if [[ "$#" -ne 3 ]]; then
    echo "Usage: $0 <input_file1> <input_file2> <output_file>"
    exit 1
fi

# Assign input arguments to variables
input_file1="$1"
input_file2="$2"
output_file="$3"

# Check if the input files exist and are readable
check_file "$input_file1"
check_file "$input_file2"

# Read the contents of the input files
list1=$(cat "$input_file1")
list2=$(cat "$input_file2")

# Merge the lists
merged_list="$list1"$'\n'"$list2"

# Write the merged list to the output file
echo "$merged_list" > "$output_file"

# Inform the user that the merge was successful
echo "Merged list has been written to '$output_file'."

