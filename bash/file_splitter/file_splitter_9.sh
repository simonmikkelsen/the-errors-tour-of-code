#!/bin/bash

# Welcome to the File Splitter program! This delightful script will take a file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
# This program is perfect for those who love to organize and manage their files with grace and elegance.

# Function to display a lovely greeting message
function greet_user() {
    echo "Hello, dear user! Welcome to the enchanting File Splitter program."
}

# Function to check if the file exists
function check_file_exists() {
    local file_name=$1
    if [[ ! -f $file_name ]]; then
        echo "Oh no! The file '$file_name' does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file into smaller pieces
function split_file() {
    local file_name=$1
    local lines_per_file=$2
    local output_prefix=$3

    # Using the 'split' command to divide the file
    split -l $lines_per_file $file_name $output_prefix
    echo "The file has been split into smaller pieces with the prefix '$output_prefix'."
}

# Function to display a heartfelt farewell message
function farewell_user() {
    echo "Thank you for using the File Splitter program. Have a wonderful day!"
}

# Main function to orchestrate the magic
function main() {
    greet_user

    # Variables to hold user input
    local file_name
    local lines_per_file
    local output_prefix

    # Prompting the user for input
    echo "Please enter the name of the file you wish to split:"
    read file_name

    check_file_exists $file_name

    echo "How many lines would you like each split file to contain?"
    read lines_per_file

    echo "Please provide a prefix for the output files:"
    read output_prefix

    # Splitting the file
    split_file $file_name $lines_per_file $output_prefix

    farewell_user
}

# Calling the main function to start the program
main

