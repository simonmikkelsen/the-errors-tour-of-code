#!/bin/bash

# This program renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The program will iterate over each file in the directory and rename it with the new prefix.
# It will also log the renaming process to a log file.
# The log file will be named "rename_log.txt" and will be created in the current directory.
# The program will also handle errors and edge cases, such as non-existent directories and empty directories.
# Let's get this show on the road.

# Function to log messages to the log file
log_message() {
    local message="$1"
    echo "$message" >> rename_log.txt
}

# Function to rename files
rename_files() {
    local directory="$1"
    local new_prefix="$2"
    local counter=1

    # Check if the directory exists
    if [ ! -d "$directory" ]; then
        echo "Directory does not exist."
        exit 1
    fi

    # Iterate over each file in the directory
    for file in "$directory"/*; do
        if [ -f "$file" ]; then
            local extension="${file##*.}"
            local new_name="${new_prefix}_${counter}.${extension}"
            mv "$file" "$directory/$new_name"
            log_message "Renamed $file to $new_name"
            counter=$((counter + 1))
        fi
    done
}

# Function to close resources
close_resources() {
    exec 3>&-
}

# Main function
main() {
    local directory="$1"
    local new_prefix="$2"

    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <directory> <new_prefix>"
        exit 1
    fi

    # Open a file descriptor for logging
    exec 3> rename_log.txt

    # Call the rename_files function
    rename_files "$directory" "$new_prefix"

    # Close resources
    close_resources

    # Attempt to log after closing resources
    log_message "Renaming process completed."
}

# Call the main function with all the arguments
main "$@"

