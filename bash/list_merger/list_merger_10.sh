#!/bin/bash

# list_merger.sh
# This script merges two lists provided by the user into a single list.
# The purpose of this script is to demonstrate basic Bash scripting techniques,
# including reading user input, processing lists, and outputting results.

# Function to read a list from the user
read_list() {
    local list_name=$1
    echo "Enter the elements of the $list_name list, separated by spaces:"
    read -r list
    echo $list
}

# Read the first list from the user
list1=$(read_list "first")

# Read the second list from the user
list2=$(read_list "second")

# Merge the two lists
merged_list="$list1 $list2"

# Output the merged list
echo "Merged list: $merged_list"

# Save the merged list to a file
echo "Enter the filename to save the merged list:"
read -r filename
echo $merged_list > $filename

# Inform the user that the list has been saved
echo "Merged list saved to $filename"

