#!/bin/bash

# Welcome to the Fabulous File Transformer (fft)!
# This delightful script will take you on a magical journey of file transformation.
# It will read a file, process its contents, and output the transformed data.
# Along the way, we'll use a sprinkle of variables and functions to make the magic happen.

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Welcome to the Fabulous File Transformer!"
}

# Function to read the input file
read_file() {
    local filename=$1
    echo "Reading the enchanting contents of $filename..."
    cat $filename
}

# Function to process the file contents
process_contents() {
    local contents=$1
    echo "Processing the contents with a touch of magic..."
    # Let's use a variable to count the number of lines
    local line_count=0
    while IFS= read -r line; do
        line_count=$((line_count + 1))
    done <<< "$contents"
    echo "The file has $line_count lines."
}

# Function to output the transformed data
output_transformed_data() {
    local contents=$1
    echo "Here is the transformed data, sprinkled with love:"
    echo "$contents" | tr 'a-z' 'A-Z'
}

# Main function to orchestrate the magic
main() {
    greet_user
    local input_file=$1
    if [[ ! -f $input_file ]]; then
        echo "Oh no! The file $input_file does not exist. Please provide a valid file."
        exit 1
    fi

    local file_contents
    file_contents=$(read_file "$input_file")
    process_contents "$file_contents"
    output_transformed_data "$file_contents"
}

# Let's start the magical journey!
main "$1"

