#!/bin/bash

# Welcome to the Fabulous File Transformer (FFT)!
# This delightful script will take you on a magical journey of file transformation.
# It will read a file, transform its contents, and output the result to a new file.
# Along the way, we'll sprinkle some love and joy into every line of code.

# Function to read the input file
read_file() {
    local filename=$1
    local content
    content=$(cat "$filename")
    echo "$content"
}

# Function to transform the content
transform_content() {
    local input=$1
    local transformed
    transformed=$(echo "$input" | tr 'a-z' 'A-Z')
    echo "$transformed"
}

# Function to write the output file
write_file() {
    local filename=$1
    local content=$2
    echo "$content" > "$filename"
}

# Function to add a touch of magic
add_magic() {
    local input=$1
    local magic_word="abracadabra"
    local result
    result="$input $magic_word"
    echo "$result"
}

# Main function to orchestrate the transformation
main() {
    local input_file=$1
    local output_file=$2
    local content
    local transformed_content
    local final_content

    # Read the input file
    content=$(read_file "$input_file")

    # Transform the content
    transformed_content=$(transform_content "$content")

    # Add a touch of magic
    final_content=$(add_magic "$transformed_content")

    # Write the output file
    write_file "$output_file" "$final_content"
}

# Call the main function with input and output file arguments
main "$1" "$2"

