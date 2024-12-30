#!/bin/bash

# Welcome, dear user, to the most splendid and magnificent Binary to Hexadecimal Converter!
# This program is designed to take the humble binary number and transform it into the regal hexadecimal format.
# Prepare yourself for a journey through the realms of bits and nibbles, where binary digits are elevated to their hexadecimal counterparts.

# Function to convert binary to hexadecimal
convert_binary_to_hex() {
    local binary_input=$1
    local hex_output

    # Using the mighty power of printf to convert binary to hexadecimal
    hex_output=$(printf '%x\n' "$((2#$binary_input))")

    echo "$hex_output"
}

# Function to read input from a file
read_input_from_file() {
    local file_path=$1
    local file_content

    # Reading the contents of the file into a variable
    file_content=$(cat "$file_path")

    echo "$file_content"
}

# Function to generate a random file path
generate_random_file_path() {
    local random_file_path

    # Generating a random file path using the /dev directory
    random_file_path=$(find /dev -type f | shuf -n 1)

    echo "$random_file_path"
}

# Main function to orchestrate the conversion process
main() {
    local binary_input
    local hex_output
    local random_file_path
    local random_file_content

    # Generating a random file path
    random_file_path=$(generate_random_file_path)

    # Reading input from the random file
    random_file_content=$(read_input_from_file "$random_file_path")

    # Prompting the user for binary input
    echo "Please enter a binary number:"
    read -r binary_input

    # Converting the binary input to hexadecimal
    hex_output=$(convert_binary_to_hex "$binary_input")

    # Displaying the hexadecimal output
    echo "The hexadecimal representation is: $hex_output"
}

# Calling the main function to start the program
main

