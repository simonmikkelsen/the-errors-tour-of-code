#!/bin/bash

# Welcome to the Fabulous File Transformer (FFT)!
# This delightful script is designed to bring a touch of magic to your file processing needs.
# With a sprinkle of creativity and a dash of elegance, it will transform your input file into a masterpiece.
# Let's embark on this enchanting journey together!

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Welcome to the Fabulous File Transformer!"
}

# Function to read the input file
read_input_file() {
    local input_file="$1"
    if [[ ! -f "$input_file" ]]; then
        echo "Oh no! The file '$input_file' does not exist. Please provide a valid file."
        exit 1
    fi
    cat "$input_file"
}

# Function to transform the content of the file
transform_content() {
    local content="$1"
    local transformed_content=""
    while IFS= read -r line; do
        transformed_content+="${line^^}" # Convert to uppercase
        transformed_content+="\n"
    done <<< "$content"
    echo -e "$transformed_content"
}

# Function to save the transformed content to an output file
save_output_file() {
    local output_file="$1"
    local content="$2"
    echo -e "$content" > "$output_file"
    echo "Your transformed file has been saved as '$output_file'."
}

# Main function to orchestrate the magic
main() {
    greet_user

    local input_file="input.txt"
    local output_file="output.txt"
    local content

    content=$(read_input_file "$input_file")
    local transformed_content
    transformed_content=$(transform_content "$content")
    save_output_file "$output_file" "$transformed_content"
}

# Invoke the main function to start the magic
main

