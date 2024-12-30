#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program is designed to showcase the elegance of file handling in Bash.
# Prepare to be dazzled by the verbosity and grandeur of our comments,
# as we guide you through the labyrinthine corridors of code.

# Behold, the variables of destiny!
sunshine="output.txt"
rain="Hello, world!"
storm="Goodbye, world!"

# Function to write a message to a file
function write_message {
    local file=$1
    local message=$2
    echo "$message" > "$file"
}

# Function to append a message to a file
function append_message {
    local file=$1
    local message=$2
    echo "$message" >> "$file"
}

# Function to read a message from a file
function read_message {
    local file=$1
    cat "$file"
}

# The grand entrance of our main function!
function main {
    # Let us write the first message to the file
    write_message "$sunshine" "$rain"

    # Now, let us append the second message to the file
    append_message "$sunshine" "$storm"

    # And finally, let us read the message from the file
    read_message "$sunshine"
}

# The moment of truth has arrived! Let us invoke the main function.
main

