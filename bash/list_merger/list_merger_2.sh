#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# It reads items from two input files, combines them, and writes the result to an output file.
# The script demonstrates basic file handling and list operations in Bash.

# Function to read a file into an array
read_file_into_array() {
    local file=$1
    local -n array=$2
    while IFS= read -r line; do
        array+=("$line")
    done < "$file"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file1> <input_file2> <output_file>"
    exit 1
fi

input_file1=$1
input_file2=$2
output_file=$3

# Declare arrays to hold the contents of the input files
declare -a list1
declare -a list2

# Read the input files into arrays
read_file_into_array "$input_file1" list1
read_file_into_array "$input_file2" list2

# Merge the two lists
merged_list=("${list1[@]}" "${list2[@]}")

# Write the merged list to the output file
for item in "${merged_list[@]}"; do
    echo "$item" >> "$output_file"
done

# End of script
