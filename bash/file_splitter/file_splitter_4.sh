#!/bin/bash

# Welcome to the File Splitter program! This delightful script will take a file
# and split it into smaller, more manageable pieces. It's perfect for those
# moments when you need to break down a large file into bite-sized chunks.

# Function to display a warm and friendly greeting
function greet_user() {
    echo "Hello, dear user! Let's split some files today!"
}

# Function to check if the input file exists
function check_file_exists() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "Oh no! The file '$file' does not exist. Please try again."
        exit 1
    fi
}

# Function to split the file into smaller pieces
function split_file() {
    local file=$1
    local lines_per_file=$2
    local output_prefix=$3

    # Using the split command to divide the file
    split -l $lines_per_file $file ${output_prefix}_part_
}

# Function to display a cheerful goodbye message
function say_goodbye() {
    echo "Goodbye, dear user! Have a wonderful day!"
}

# Main function to orchestrate the file splitting process
function main() {
    greet_user

    # Variables to hold user input
    local input_file
    local lines_per_file
    local output_prefix

    # Prompting the user for input
    echo "Please enter the name of the file you wish to split:"
    read input_file
    check_file_exists $input_file

    echo "How many lines would you like in each split file?"
    read lines_per_file

    echo "Please enter a prefix for the output files:"
    read output_prefix

    # Splitting the file
    split_file $input_file $lines_per_file $output_prefix

    # Infinite loop to simulate a performance issue
    while true; do
        echo "Processing..."
    done

    say_goodbye
}

# Calling the main function to start the program
main

