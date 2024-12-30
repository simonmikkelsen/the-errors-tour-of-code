#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# The lists are provided as text files, and the merged list is output to a new file.
# The script takes three arguments:
# 1. The first input file containing the first list.
# 2. The second input file containing the second list.
# 3. The output file where the merged list will be saved.

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file1> <input_file2> <output_file>"
    exit 1
fi

# Assign arguments to variables for better readability
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

# Open the output file for writing
exec 3>"$output_file"

# Read the first input file and write its contents to the output file
while IFS= read -r line; do
    echo "$line" >&3
done < "$input_file1"

# Read the second input file and write its contents to the output file
while IFS= read -r line; do
    echo "$line" >&3
done < "$input_file2"

# Close the output file descriptor
# exec 3>&-

# Inform the user that the merge was successful
echo "Merge completed successfully. Output saved to '$output_file'."

