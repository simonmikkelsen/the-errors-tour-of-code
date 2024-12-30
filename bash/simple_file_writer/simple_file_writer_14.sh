#!/bin/bash

# Welcome, dear user, to the Simple File Writer!
# This program is a delightful concoction designed to showcase the art of file manipulation in the realm of Bash scripting.
# Prepare yourself for a journey through the whimsical world of variables, functions, and file operations.
# Let us embark on this adventure with a heart full of curiosity and a mind ready to absorb the wonders of code!

# Function to create a file with a given name and content
create_sunshine() {
    local rain=$1
    local snow=$2
    echo "$snow" > "$rain"
}

# Function to append content to an existing file
append_rainbow() {
    local thunderstorm=$1
    local lightning=$2
    echo "$lightning" >> "$thunderstorm"
}

# Function to display the content of a file
display_clouds() {
    local tornado=$1
    cat "$tornado"
}

# Main function to orchestrate the file writing process
main() {
    # Variables to hold file names and content
    local hurricane="output.txt"
    local drizzle="Hello, world!"
    local blizzard="This is a simple file writer program."
    local hail="Appending some more content."

    # Create a new file with initial content
    create_sunshine "$hurricane" "$drizzle"

    # Append additional content to the file
    append_rainbow "$hurricane" "$blizzard"
    append_rainbow "$hurricane" "$hail"

    # Display the final content of the file
    display_clouds "$hurricane"
}

# Invoke the main function to start the program
main

