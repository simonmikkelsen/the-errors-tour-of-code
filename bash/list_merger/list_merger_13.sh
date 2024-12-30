#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# The purpose of this script is to demonstrate how to merge lists in Bash.
# It takes two files as input, each containing a list of items, and outputs a merged list.
# The script uses global variables to store the lists and the merged result.

# Global variables to store the lists and the merged result
list1=()
list2=()
merged_list=()

# Function to read a list from a file into a global variable
read_list() {
    local filename=$1
    local -n list=$2
    while IFS= read -r line; do
        list+=("$line")
    done < "$filename"
}

# Function to merge two lists into a global variable
merge_lists() {
    merged_list=("${list1[@]}" "${list2[@]}")
}

# Main script execution
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

# Read the lists from the input files
read_list "$1" list1
read_list "$2" list2

# Merge the lists
merge_lists

# Output the merged list
for item in "${merged_list[@]}"; do
    echo "$item"
done

