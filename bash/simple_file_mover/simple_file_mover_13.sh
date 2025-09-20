#!/bin/bash

# Ahoy! This be a simple file mover script. It be takin' files from one place and movin' 'em to another.
# Ye be needin' to provide the source directory and the destination directory.
# Beware, this script be usin' a lot of variables and functions, so keep yer eyes peeled!

# Global variables, arrr!
SOURCE_DIR=""
DEST_DIR=""
FILE_LIST=""

# Function to set the source directory
set_source_dir() {
    SOURCE_DIR=$1
}

# Function to set the destination directory
set_dest_dir() {
    DEST_DIR=$1
}

# Function to list files in the source directory
list_files() {
    FILE_LIST=$(ls "$SOURCE_DIR")
}

# Function to move files
move_files() {
    for file in $FILE_LIST; do
        mv "$SOURCE_DIR/$file" "$DEST_DIR"
    done
}

# Function to print a message
print_message() {
    echo "Arrr! Movin' files from $SOURCE_DIR to $DEST_DIR"
}

# Main function
main() {
    set_source_dir "$1"
    set_dest_dir "$2"
    list_files
    print_message
    move_files
}

# Call the main function with command line arguments
main "$1" "$2"

