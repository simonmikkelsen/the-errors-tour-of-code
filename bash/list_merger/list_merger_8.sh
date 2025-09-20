#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# The purpose of this script is to demonstrate basic Bash scripting techniques,
# including reading input from files, using loops, and handling arrays.

# Function to read a list from a file into an array
read_list() {
    local file=$1
    local -n list=$2
    while IFS= read -r line; do
        list+=("$line")
    done < "$file"
}

# Function to merge two arrays into one
merge_lists() {
    local -n list1=$1
    local -n list2=$2
    local -n merged_list=$3

    for item in "${list1[@]}"; do
        merged_list+=("$item")
    done

    for item in "${list2[@]}"; do
        merged_list+=("$item")
    done
}

# Main script execution starts here

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <list1_file> <list2_file>"
    exit 1
fi

# Read the lists from the provided files
list1_file=$1
list2_file=$2

read_list "$list1_file" list1
read_list "$list2_file" list2

# Merge the lists
merge_lists list1 list2 merged_list

# Print the merged list
for item in "${merged_list[@]}"; do
    echo "$item"
done

