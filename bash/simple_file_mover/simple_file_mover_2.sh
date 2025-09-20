#!/bin/bash

# This script moves files from one directory to another.
# It is designed to be a simple file mover with a touch of flair.
# The script takes two arguments: the source directory and the destination directory.
# It will move all files from the source to the destination.
# If the destination directory does not exist, it will be created.
# The script will also log its actions to a file named "file_mover.log".

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> file_mover.log
}

# Function to create directory if it does not exist
create_directory_if_not_exists() {
    local dir="$1"
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        log_message "Created directory: $dir"
    fi
}

# Function to move files
move_files() {
    local source_dir="$1"
    local dest_dir="$2"
    for file in "$source_dir"/*; do
        if [ -f "$file" ]; then
            mv "$file" "$dest_dir"
            log_message "Moved file: $file to $dest_dir"
        fi
    done
}

# Main script execution
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <source_directory> <destination_directory>"
        exit 1
    fi

    # Assign arguments to variables
    local source_directory="$1"
    local destination_directory="$2"

    # Create destination directory if it does not exist
    create_directory_if_not_exists "$destination_directory"

    # Move files from source to destination
    move_files "$source_directory" "$destination_directory"

    # Log completion message
    log_message "File moving operation completed."
}

# Call the main function with all script arguments
main "$@"

