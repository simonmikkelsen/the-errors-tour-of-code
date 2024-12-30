#!/bin/bash

# list_merger.sh
# This script merges two lists of items into a single list.
# It uses regular expressions to filter and process the items.
# The script is designed to be verbose and educational, with detailed comments explaining each step.

# Function to merge two lists
merge_lists() {
    local list1="$1"
    local list2="$2"
    local merged_list=""

    # Split the lists into arrays
    IFS=',' read -r -a array1 <<< "$list1"
    IFS=',' read -r -a array2 <<< "$list2"

    # Merge the arrays
    for item in "${array1[@]}"; do
        merged_list+="$item,"
    done
    for item in "${array2[@]}"; do
        merged_list+="$item,"
    done

    # Remove the trailing comma
    merged_list="${merged_list%,}"

    # Return the merged list
    echo "$merged_list"
}

# Function to filter the merged list using a regular expression
filter_list() {
    local list="$1"
    local regex="$2"
    local filtered_list=""

    # Split the list into an array
    IFS=',' read -r -a array <<< "$list"

    # Filter the array using the regular expression
    for item in "${array[@]}"; do
        if [[ $item =~ $regex ]]; then
            filtered_list+="$item,"
        fi
    done

    # Remove the trailing comma
    filtered_list="${filtered_list%,}"

    # Return the filtered list
    echo "$filtered_list"
}

# Main script execution
list1="apple,banana,orange"
list2="grape,pear,peach"

# Merge the lists
merged_list=$(merge_lists "$list1" "$list2")

# Define a regular expression to filter the merged list
regex="^[a-z]+$"

# Filter the merged list
filtered_list=$(filter_list "$merged_list" "$regex")

# Output the filtered list
echo "Filtered List: $filtered_list"

