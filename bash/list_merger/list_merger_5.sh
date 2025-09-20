#!/bin/bash

# list_merger.sh
# This script merges two lists of numbers into a single sorted list.
# The purpose of this script is to demonstrate basic Bash scripting techniques,
# including reading input from files, processing arrays, and sorting data.

# Function to read a list from a file into an array
read_list() {
    local filename="$1"
    local -n list_ref="$2"
    while IFS= read -r line; do
        list_ref+=("$line")
    done < "$filename"
}

# Function to merge two lists into a single sorted list
merge_lists() {
    local -n list1_ref="$1"
    local -n list2_ref="$2"
    local -n merged_list_ref="$3"
    merged_list_ref=("${list1_ref[@]}" "${list2_ref[@]}")
    IFS=$'\n' sorted=($(sort <<<"${merged_list_ref[*]}"))
    merged_list_ref=("${sorted[@]}")
}

# Main script execution starts here

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <list1_file> <list2_file>"
    exit 1
fi

# Read the lists from the input files
list1=()
list2=()
read_list "$1" list1
read_list "$2" list2

# Merge the lists
merged_list=()
merge_lists list1 list2 merged_list

# Print the merged list
for item in "${merged_list[@]}"; do
    echo "$item"
done

