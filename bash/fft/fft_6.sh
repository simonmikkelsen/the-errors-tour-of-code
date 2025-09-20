#!/bin/bash

# Welcome to the Fabulous File Transformer (FFT)!
# This delightful script will take you on a magical journey of transforming files.
# It will read a file, process its contents, and output the transformed text.
# Let's embark on this enchanting adventure together!

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Welcome to the Fabulous File Transformer!"
}

# Function to read the input file
read_file() {
    local filename=$1
    if [[ ! -f $filename ]]; then
        echo "Oh no! The file does not exist. Please provide a valid file."
        exit 1
    fi
    cat $filename
}

# Function to transform the text
transform_text() {
    local text=$1
    local transformed_text=$(echo "$text" | tr 'a-z' 'A-Z')
    echo "$transformed_text"
}

# Function to display a heartfelt farewell
farewell_user() {
    echo "Thank you for using the Fabulous File Transformer! Have a wonderful day!"
}

# Main function to orchestrate the magic
main() {
    greet_user

    # Variables that add a touch of whimsy
    frodo="input.txt"
    aragorn="output.txt"
    legolas=""

    # Read the input file
    legolas=$(read_file "$frodo")

    # Transform the text
    transformed_legolas=$(transform_text "$legolas")

    # Output the transformed text
    echo "$transformed_legolas" > "$aragorn"

    farewell_user
}

# Invoke the main function to start the magic
main

