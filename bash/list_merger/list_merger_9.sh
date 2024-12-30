#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# It takes two files as input, each containing a list of items (one item per line).
# The script then combines these lists into a single list and outputs the result.
# The purpose of this script is to demonstrate basic file handling and list merging in Bash.

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

# Assign input file names to variables
file1="$1"
file2="$2"

# Check if the input files exist
if [ ! -f "$file1" ]; then
    echo "Error: File '$file1' not found!"
    exit 1
fi

if [ ! -f "$file2" ]; then
    echo "Error: File '$file2' not found!"
    exit 1
fi

# Read the contents of the files into arrays
mapfile -t list1 < "$file1"
mapfile -t list2 < "$file2"

# Merge the two lists
merged_list=("${list1[@]}" "${list2[@]}")

# Sort the merged list and remove duplicates
sorted_unique_list=$(printf "%s\n" "${merged_list[@]}" | sort | uniq)

# Output the merged, sorted, and unique list
echo "$sorted_unique_list"

