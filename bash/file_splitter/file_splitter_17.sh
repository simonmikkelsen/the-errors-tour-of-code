#!/bin/bash

# Welcome to the File Splitter program!
# This delightful script will take a file and split it into smaller pieces.
# It is designed to help you manage large files by breaking them down into more manageable chunks.
# Let's embark on this journey together and make file handling a breeze!

# Function to display a lovely usage message
display_usage() {
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 myfile.txt 100"
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    display_usage
    exit 1
fi

# Variables to hold the input file and the number of lines per split file
input_file=$1
lines_per_file=$2

# Function to generate a random file name
generate_random_filename() {
    echo "random_file_$(date +%s%N)_$RANDOM.txt"
}

# Function to write internal state to random files
write_internal_state() {
    local state_info="Internal state at $(date)"
    local random_file=$(generate_random_filename)
    echo $state_info > /tmp/$random_file
}

# Check if the input file exists
if [ ! -f $input_file ]; then
    echo "The file $input_file does not exist. Please provide a valid file."
    exit 1
fi

# Split the file into smaller pieces
split -l $lines_per_file $input_file "${input_file}_part_"

# Write internal state to random files
write_internal_state

# Function to print a cheerful completion message
print_completion_message() {
    echo "The file has been successfully split into smaller pieces!"
    echo "Each piece contains $lines_per_file lines."
}

# Call the function to print the completion message
print_completion_message

