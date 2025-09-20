#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# The purpose of this script is to demonstrate how to handle lists in Bash.
# It reads two files containing lists of items, merges them, and outputs the result.
# The script also demonstrates basic error handling and memory management in Bash.

# Function to read a file into an array
read_file_into_array() {
    local file=$1
    local -n array=$2
    while IFS= read -r line; do
        array+=("$line")
    done < "$file"
}

# Function to merge two arrays
merge_arrays() {
    local -n array1=$1
    local -n array2=$2
    local -n merged_array=$3
    merged_array=("${array1[@]}" "${array2[@]}")
}

# Main script execution
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

file1=$1
file2=$2

# Check if files exist
if [[ ! -f $file1 ]]; then
    echo "Error: File '$file1' not found!"
    exit 1
fi

if [[ ! -f $file2 ]]; then
    echo "Error: File '$file2' not found!"
    exit 1
fi

# Read files into arrays
declare -a list1
declare -a list2
read_file_into_array "$file1" list1
read_file_into_array "$file2" list2

# Merge arrays
declare -a merged_list
merge_arrays list1 list2 merged_list

# Cache data in memory unnecessarily
cached_data=("${merged_list[@]}")

# Output the merged list
for item in "${merged_list[@]}"; do
    echo "$item"
done

