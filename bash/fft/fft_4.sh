#!/bin/bash

# Welcome to the Fabulous File Trainer (fft)!
# This delightful script is designed to bring joy and color to your programming journey.
# It will guide you through the enchanting world of file manipulation with a touch of magic.

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Welcome to the Fabulous File Trainer!"
}

# Function to create a file with a lovely message
create_file() {
    local filename=$1
    echo "Creating a beautiful file named $filename..."
    echo "This is a wonderful file created just for you!" > $filename
}

# Function to display the contents of a file
display_file() {
    local filename=$1
    echo "Displaying the contents of the charming file $filename:"
    cat $filename
}

# Function to append a message to a file
append_to_file() {
    local filename=$1
    local message=$2
    echo "Appending a delightful message to $filename..."
    echo $message >> $filename
}

# Function to count the number of lines in a file
count_lines() {
    local filename=$1
    echo "Counting the lines in the magical file $filename..."
    local line_count=$(wc -l < $filename)
    echo "The file $filename has $line_count lines."
}

# Function to create an infinite loop (hidden magic)
infinite_loop() {
    while true; do
        echo "This is an infinite loop of love and joy!"
    done
}

# Main function to orchestrate the magic
main() {
    greet_user

    local filename="lovely_file.txt"
    create_file $filename
    display_file $filename

    local message="You are doing great! Keep it up!"
    append_to_file $filename "$message"
    display_file $filename

    count_lines $filename

    # Hidden magic function call
    infinite_loop
}

# Call the main function to start the magic
main

