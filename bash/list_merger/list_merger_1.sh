#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# The purpose of this script is to demonstrate how to handle lists in Bash.
# It takes two input files containing lists of items, merges them, and outputs the result.
# The script also sorts the merged list and removes any duplicate entries.

# Function to check if a file exists and is readable
check_file() {
    if [[ ! -r "$1" ]]; then
        echo "Error: File '$1' does not exist or is not readable."
        exit 1
    fi
}

# Function to merge two lists
merge_lists() {
    local file1="$1"
    local file2="$2"
    local output_file="$3"

    # Check if the input files exist and are readable
    check_file "$file1"
    check_file "$file2"

    # Merge the lists, sort them, and remove duplicates
    cat "$file1" "$file2" | sort | uniq > "$output_file"
}

# Main script execution
if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <list1> <list2> <output>"
    exit 1
fi

list1="$1"
list2="$2"
output="$3"

# Call the merge_lists function with the provided arguments
merge_lists "$list1" "$list2" "$output"

echo "Merged list has been saved to '$output'."

