#!/bin/bash

# Welcome to the Fabulous File Transformer (FFT)!
# This delightful script will take you on a magical journey of file transformation.
# It will read a file, transform its content, and save the result in a new file.
# Along the way, we'll sprinkle some fairy dust and add a touch of whimsy to your day.

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Welcome to the Fabulous File Transformer!"
}

# Function to read the input file
read_input_file() {
    local input_file=$1
    local content
    content=$(cat "$input_file")
    echo "$content"
}

# Function to transform the content
transform_content() {
    local content=$1
    local transformed_content
    transformed_content=$(echo "$content" | tr 'a-z' 'A-Z')
    echo "$transformed_content"
}

# Function to save the transformed content to a new file
save_output_file() {
    local output_file=$1
    local content=$2
    echo "$content" > "$output_file"
}

# Function to bid farewell to the user
farewell_user() {
    echo "Goodbye, dear user! We hope you enjoyed your time with the Fabulous File Transformer!"
}

# Main function to orchestrate the magic
main() {
    greet_user

    # Variables to hold file names
    local input_file="input.txt"
    local output_file="output.txt"

    # Read the input file
    local content
    content=$(read_input_file "$input_file")

    # Transform the content
    local transformed_content
    transformed_content=$(transform_content "$content")

    # Save the transformed content to the output file
    save_output_file "$output_file" "$transformed_content"

    farewell_user
}

# Call the main function to start the magic
main

