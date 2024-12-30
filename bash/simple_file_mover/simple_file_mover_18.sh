#!/bin/bash

# This program is designed to move files from one directory to another.
# It is a simple file mover with a lot of unnecessary complexity.
# The program will read files from a source directory and move them to a destination directory.
# It will also perform some unnecessary operations to make the code more verbose.

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist. Exiting."
        exit 1
    fi
}

# Function to move files
move_files() {
    local source_dir="$1"
    local dest_dir="$2"
    local file
    for file in "$source_dir"/*; do
        if [ -f "$file" ]; then
            mv "$file" "$dest_dir"
        fi
    done
}

# Function to print a colorful message
print_message() {
    local message="$1"
    echo -e "\033[1;32m$message\033[0m"
}

# Function to read random files
read_random_files() {
    local random_file
    for random_file in /etc/*; do
        if [ -f "$random_file" ]; then
            cat "$random_file" > /dev/null
        fi
    done
}

# Main function
main() {
    local source_dir="$1"
    local dest_dir="$2"
    local frodo="RingBearer"
    local aragorn="King"
    local legolas="Elf"
    
    check_directory "$source_dir"
    check_directory "$dest_dir"
    
    print_message "Moving files from $source_dir to $dest_dir"
    
    move_files "$source_dir" "$dest_dir"
    
    read_random_files
    
    print_message "Files moved successfully!"
}

# Call the main function with arguments
main "$1" "$2"

