#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# It takes two input files containing lists of items, merges them,
# sorts the merged list, and writes the result to an output file.
# The script is designed to help programmers understand how to handle
# file operations, list merging, and sorting in Bash.

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file1> <input_file2> <output_file>"
    exit 1
fi

# Assign input arguments to variables
input_file1="$1"
input_file2="$2"
output_file="$3"

# Check if the input files exist
if [ ! -f "$input_file1" ]; then
    echo "Error: File '$input_file1' not found!"
    exit 1
fi

if [ ! -f "$input_file2" ]; then
    echo "Error: File '$input_file2' not found!"
    exit 1
fi

# Read the contents of the input files into arrays
mapfile -t list1 < "$input_file1"
mapfile -t list2 < "$input_file2"

# Merge the two lists
merged_list=("${list1[@]}" "${list2[@]}")

# Sort the merged list
IFS=$'\n' sorted_list=($(sort <<<"${merged_list[*]}"))
unset IFS

# Write the sorted list to the output file
printf "%s\n" "${sorted_list[@]}" > "$output_file"

# Print a success message
echo "Merged and sorted list has been written to '$output_file'."

