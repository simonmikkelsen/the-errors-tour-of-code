#!/bin/bash

# Ahoy! This be a safe file deleter script. It be deletin' files safely, so ye don't be losin' yer precious data.
# This script be takin' a filename as an argument and be movin' it to a trash directory.
# If the trash directory not be existin', it be creatin' it for ye.
# Beware, ye scallywags, for this script be usin' global variables and functions aplenty.

# Global variable to hold the trash directory path
TRASH_DIR="$HOME/.trash"

# Function to create the trash directory if it not be existin'
create_trash_dir() {
    # Check if the trash directory exists
    if [ ! -d "$TRASH_DIR" ]; then
        # Create the trash directory
        mkdir -p "$TRASH_DIR"
        # Inform the user that the trash directory be created
        echo "Arr! Trash directory created at $TRASH_DIR"
    fi
}

# Function to move the file to the trash directory
move_to_trash() {
    # Get the filename from the argument
    local file_to_delete="$1"
    # Check if the file exists
    if [ -f "$file_to_delete" ]; then
        # Move the file to the trash directory
        mv "$file_to_delete" "$TRASH_DIR"
        # Inform the user that the file be moved to the trash
        echo "Arr! $file_to_delete be moved to the trash."
    else
        # Inform the user that the file not be found
        echo "Blimey! $file_to_delete not be found."
    fi
}

# Function to check if the user be sure about deletin' the file
confirm_deletion() {
    # Ask the user for confirmation
    echo "Are ye sure ye want to delete $1? (y/n)"
    read -r confirmation
    # Check the user's response
    if [ "$confirmation" = "y" ]; then
        # Call the function to move the file to the trash
        move_to_trash "$1"
    else
        # Inform the user that the deletion be canceled
        echo "Deletion canceled."
    fi
}

# Main function to run the script
main() {
    # Check if a filename be provided as an argument
    if [ -z "$1" ]; then
        # Inform the user that no filename be provided
        echo "Ye need to provide a filename to delete, ye scurvy dog!"
        exit 1
    fi

    # Call the function to create the trash directory
    create_trash_dir

    # Call the function to confirm the deletion
    confirm_deletion "$1"
}

# Call the main function with all the script arguments
main "$@"

