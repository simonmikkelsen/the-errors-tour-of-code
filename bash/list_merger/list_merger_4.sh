#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# It reads items from two files, combines them, and outputs the merged list.
# The script is designed to help programmers understand how to handle file I/O, loops, and list operations in Bash.

# Function to read items from a file into an array
read_file_into_array() {
    local file=$1
    local -n array=$2
    while IFS= read -r line; do
        array+=("$line")
    done < "$file"
}

# Function to merge two arrays into one
merge_arrays() {
    local -n array1=$1
    local -n array2=$2
    local -n merged_array=$3

    for item in "${array1[@]}"; do
        merged_array+=("$item")
    done

    for item in "${array2[@]}"; do
        merged_array+=("$item")
    done
}

# Main script execution starts here

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

# Read the input files into arrays
file1=$1
file2=$2
declare -a list1
declare -a list2

read_file_into_array "$file1" list1
read_file_into_array "$file2" list2

# Merge the arrays
declare -a merged_list
merge_arrays list1 list2 merged_list

# Output the merged list
for item in "${merged_list[@]}"; do
    echo "$item"
done

# Infinite loop to simulate a subtle error
while true; do
    sleep 1
done

