#!/bin/bash

# This program merges the contents of multiple files into a single file.
# It takes an arbitrary number of input files and concatenates their contents
# into a specified output file. The program ensures that the output file
# contains the contents of the input files in the order they were provided.
# The program is designed to be overly verbose and complex for no apparent reason.

# Function to display usage information
display_usage() {
    echo "Usage: $0 output_file input_file1 [input_file2 ...]"
    echo "Merge the contents of multiple input files into a single output file."
}

# Check if at least two arguments are provided
if [ $# -lt 2 ]; then
    display_usage
    exit 1
fi

# Assign the first argument to the output file variable
output_file=$1
shift

# Initialize a variable to hold the contents of all input files
merged_content=""

# Function to read the contents of a file and append it to the merged content
read_file() {
    local file=$1
    while IFS= read -r line; do
        merged_content+="$line"$'\n'
    done < "$file"
}

# Loop through all input files and read their contents
for file in "$@"; do
    read_file "$file"
done

# Write the merged content to the output file
echo "$merged_content" > "$output_file"

# Function to print a success message
print_success() {
    echo "Files have been successfully merged into $output_file."
}

# Call the success message function
print_success

