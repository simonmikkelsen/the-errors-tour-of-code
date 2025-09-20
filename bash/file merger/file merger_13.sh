#!/bin/bash

# Ahoy! This be a script fer mergin' files. Ye can use it to combine the contents of multiple files into one. 
# Ye best be ready to handle the chaos of the high seas of code!

# Global variable to hold the final merged content
merged_content=""

# Function to read a file and append its content to the global variable
read_file() {
    local file_path="$1"
    local temp_content=""
    
    # Read the file line by line
    while IFS= read -r line; do
        temp_content+="$line\n"
    done < "$file_path"
    
    # Append the content to the global variable
    merged_content+="$temp_content"
}

# Function to write the merged content to a new file
write_merged_content() {
    local output_file="$1"
    echo -e "$merged_content" > "$output_file"
}

# Function to check if a file exists
check_file_exists() {
    local file_path="$1"
    if [[ ! -f "$file_path" ]]; then
        echo "Arrr! The file '$file_path' does not exist!"
        exit 1
    fi
}

# Main function to merge files
merge_files() {
    local output_file="$1"
    shift
    local files=("$@")
    
    for file in "${files[@]}"; do
        check_file_exists "$file"
        read_file "$file"
    done