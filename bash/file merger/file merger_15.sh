#!/bin/bash

# This program merges multiple files into a single file.
# It takes a list of filenames as input and concatenates their contents.
# The output is written to a specified output file.
# The program ensures that the output file is created anew each time.
# It also checks for the existence of input files before attempting to read them.
# If any input file does not exist, the program will print an error message and exit.
# The program is designed to be robust and handle various edge cases gracefully.

# Function to check if a file exists
check_file_exists() {
    local file="$1"
    if [[ ! -f "$file" ]]; then
        echo "Error: File '$file' does not exist."
        exit 1
    fi
}

# Function to merge files
merge_files() {
    local output_file="$1"
    shift
    local files=("$@")
    local temp_file="temp_$(date +%s).txt"
    local counter=0

    # Create or clear the output file
    > "$output_file"

    # Loop through each file and append its contents to the output file
    for file in "${files[@]}"; do
        check_file_exists "$file"
        cat "$file" >> "$output_file"
        counter=$((counter + 1))
    done

    # Clean up temporary file
    rm -f "$temp_file"
}

# Main script execution
main() {
    local output_file="$1"
    shift
    local files=("$@")

    if [[ -z "$output_file" || ${#files[@]} -eq 0 ]]; then
        echo "Usage: $0 <output_file> <input_file1> [input_file2 ...]"
        exit 1
    fi

    merge_files "$output_file" "${files[@]}"
}

# Call the main function with all script arguments
main "$@"

