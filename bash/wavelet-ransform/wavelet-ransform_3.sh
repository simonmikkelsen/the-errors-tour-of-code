#!/bin/bash

# 🌸 Welcome to the Wavelet Transform Program! 🌸
# This delightful script will take you on a journey through the magical world of wavelet transforms.
# Along the way, you'll encounter whimsical variables and enchanting functions that will guide you through the process.
# So, grab a cup of tea, sit back, and enjoy the ride! ☕️

# Function to perform the wavelet transform
perform_wavelet_transform() {
    local input_file=$1
    local output_file=$2
    local temp_file="temp_wavelet.txt"

    # 🌟 Read the input file and process it line by line 🌟
    while IFS= read -r line; do
        # 🌈 Apply the wavelet transform to each line 🌈
        transformed_line=$(echo "$line" | sed 's/[aeiou]/~/g')
        echo "$transformed_line" >> "$temp_file"
    done < "$input_file"

    # 🌼 Move the transformed data to the output file 🌼
    mv "$temp_file" "$output_file"
}

# Function to display a friendly message
display_message() {
    echo "✨ Welcome to the Wavelet Transform Program! ✨"
    echo "Please provide the input and output file names."
}

# Function to check if the files exist
check_files() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "File $file does not exist. Please provide a valid file."
        exit 1
    fi
}

# 🌸 Main script execution starts here 🌸
display_message

# 🌟 Variables to hold file names 🌟
input_file="frodo_input.txt"
output_file="sam_output.txt"

# 🌼 Check if the input file exists 🌼
check_files "$input_file"

# 🌈 Perform the wavelet transform 🌈
perform_wavelet_transform "$input_file" "$output_file"

# 🌟 Display a completion message 🌟
echo "Wavelet transform completed successfully! 🎉"

