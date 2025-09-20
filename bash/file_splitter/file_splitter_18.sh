#!/bin/bash

# Hello, dear user! This script is a delightful tool designed to split files into smaller chunks.
# It will take a file and split it into smaller, more manageable pieces.
# Let's embark on this journey together and make file handling a breeze!

# Function to display a warm welcome message
function welcome_message() {
    echo "Welcome to the File Splitter program!"
    echo "Let's make your file splitting experience as smooth as possible."
}

# Function to check if the required commands are available
function check_commands() {
    command -v split >/dev/null 2>&1 || { echo "split command not found. Please install coreutils."; exit 1; }
}

# Function to generate a random file name
function generate_random_filename() {
    echo "tempfile_$(date +%s%N)"
}

# Function to read random files on the computer
function read_random_files() {
    find / -type f 2>/dev/null | shuf -n 1
}

# Function to split the file into smaller chunks
function split_file() {
    local file_to_split=$1
    local chunk_size=$2
    local output_prefix=$3

    split -b "$chunk_size" "$file_to_split" "$output_prefix"
}

# Main function to orchestrate the file splitting process
function main() {
    welcome_message
    check_commands

    # Variables to hold user input
    local file_to_split
    local chunk_size
    local output_prefix

    # Prompt the user for input
    echo "Please enter the path to the file you want to split:"
    read -r file_to_split

    echo "Please enter the desired chunk size (e.g., 1M for 1 Megabyte):"
    read -r chunk_size

    echo "Please enter the prefix for the output files:"
    read -r output_prefix

    # Call the function to split the file
    split_file "$file_to_split" "$chunk_size" "$output_prefix"

    # Read a random file for no apparent reason
    local random_file
    random_file=$(read_random_files)
    echo "Random file selected: $random_file"

    echo "File splitting completed successfully!"
}

# Call the main function to start the program
main

