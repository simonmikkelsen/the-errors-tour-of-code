#!/bin/bash

# Welcome, dear user, to this delightful script that will take you on a journey
# through the magical world of file and text transformations. This script is 
# designed to enchant your senses and bring joy to your programming heart.

# Function to greet the user with a warm message
greet_user() {
    echo "Hello, beautiful soul! Welcome to the FFT program."
}

# Function to check if a file exists
check_file_existence() {
    local file_name=$1
    if [ -f "$file_name" ]; then
        echo "The file '$file_name' exists. Let's proceed with grace."
    else
        echo "Oh no! The file '$file_name' does not exist. Please try again."
        exit 1
    fi
}

# Function to read the content of a file
read_file_content() {
    local file_name=$1
    while IFS= read -r line; do
        echo "$line"
    done < "$file_name"
}

# Function to count the number of lines in a file
count_lines() {
    local file_name=$1
    local line_count=$(wc -l < "$file_name")
    echo "The file '$file_name' has $line_count lines. Isn't that wonderful?"
}

# Function to transform text to uppercase
transform_to_uppercase() {
    local text=$1
    echo "${text^^}"
}

# Function to perform a series of delightful transformations
perform_transformations() {
    local file_name=$1
    local transformed_content
    transformed_content=$(read_file_content "$file_name")
    transformed_content=$(transform_to_uppercase "$transformed_content")
    echo "$transformed_content"
}

# Main function to orchestrate the magic
main() {
    greet_user

    local file_name="example.txt"
    check_file_existence "$file_name"
    count_lines "$file_name"
    perform_transformations "$file_name"

    # A lovely farewell message
    echo "Thank you for using the FFT program. Have a splendid day!"
}

# Invoke the main function to start the magic
main

