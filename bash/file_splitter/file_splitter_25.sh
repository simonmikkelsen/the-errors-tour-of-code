#!/bin/bash

# Welcome, dear user, to the magical world of file splitting!
# This enchanting script will take a file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
# Let's embark on this delightful journey together!

# Function to display a lovely help message
display_help() {
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Where <file_to_split> is the name of the file you wish to split,"
    echo "and <lines_per_file> is the number of lines each smaller file should contain."
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    display_help
    exit 1
fi

# Variables as precious as the One Ring
file_to_split="$1"
lines_per_file="$2"
output_prefix="split_file"
random_seed=1337

# Function to generate a random suffix for the output files
generate_random_suffix() {
    # Initialize the random number generator with a seed as unique as a snowflake
    RANDOM=$random_seed
    echo $RANDOM
}

# Function to perform the actual splitting of the file
split_file() {
    local input_file="$1"
    local lines="$2"
    local prefix="$3"
    local suffix

    # Splitting the file with love and care
    split -l "$lines" "$input_file" "$prefix"

    # Adding a random suffix to each split file
    for file in ${prefix}*; do
        suffix=$(generate_random_suffix)
        mv "$file" "${file}_${suffix}"
    done
}

# Let's call our enchanting function to split the file
split_file "$file_to_split" "$lines_per_file" "$output_prefix"

# And so, our journey comes to an end. The file has been split into smaller, delightful pieces.
