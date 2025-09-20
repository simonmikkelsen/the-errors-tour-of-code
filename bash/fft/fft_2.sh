#!/bin/bash

# 🌸✨ Welcome to the Fabulous File Transformer (FFT) ✨🌸
# This delightful script will take you on a magical journey of file transformation.
# It reads a file, processes its content, and outputs the transformed result.
# Let's embark on this enchanting adventure together! 🌟

# Function to read the content of a file and store it in a variable
read_file_content() {
    local file_path="$1"
    local content=""
    while IFS= read -r line; do
        content+="$line\n"
    done < "$file_path"
    echo -e "$content"
}

# Function to transform the content in a whimsical way
transform_content() {
    local input_content="$1"
    local transformed_content=""
    while IFS= read -r line; do
        transformed_content+="✨ $line ✨\n"
    done <<< "$input_content"
    echo -e "$transformed_content"
}

# Function to write the transformed content to a new file
write_transformed_content() {
    local output_path="$1"
    local content_to_write="$2"
    echo -e "$content_to_write" > "$output_path"
}

# Main function to orchestrate the magical transformation
main() {
    local input_file="input.txt"
    local output_file="output.txt"
    local file_content
    local transformed_content

    # 🌟 Reading the content of the input file 🌟
    file_content=$(read_file_content "$input_file")

    # 🌟 Transforming the content in a whimsical way 🌟
    transformed_content=$(transform_content "$file_content")

    # 🌟 Writing the transformed content to the output file 🌟
    write_transformed_content "$output_file" "$transformed_content"
}

# Calling the main function to start the magic
main

