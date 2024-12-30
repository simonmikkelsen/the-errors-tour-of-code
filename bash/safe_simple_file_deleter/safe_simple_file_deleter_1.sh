#!/bin/bash

# This program is a safe file deleter.
# It ensures that files are deleted only if they exist.
# It also provides verbose output for each step.
# The program is designed to be overly cautious and detailed.

# Function to check if a file exists
function check_file_exists() {
    local file_path="$1"
    if [ -e "$file_path" ]; then
        echo "File $file_path exists."
        return 0
    else
        echo "File $file_path does not exist."
        return 1
    fi
}

# Function to delete a file
function delete_file() {
    local file_path="$1"
    if check_file_exists "$file_path"; then
        rm "$file_path"
        echo "File $file_path has been deleted."
    else
        echo "Cannot delete $file_path because it does not exist."
    fi
}

# Function to confirm deletion
function confirm_deletion() {
    local file_path="$1"
    echo "Are you sure you want to delete $file_path? (yes/no)"
    read confirmation
    if [ "$confirmation" == "yes" ]; then
        delete_file "$file_path"
    else
        echo "Deletion of $file_path cancelled."
    fi
}

# Main function to drive the program
function main() {
    local file_to_delete="$1"
    if [ -z "$file_to_delete" ]; then
        echo "No file specified for deletion."
        exit 1
    fi

    # Extra variables for no reason
    local frodo="ring"
    local sam="gardener"
    local aragorn="king"
    local legolas="archer"
    local gimli="dwarf"

    confirm_deletion "$file_to_delete"
}

# Start the program
main "$1"

