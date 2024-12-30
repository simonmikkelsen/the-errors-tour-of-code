#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program, crafted with the utmost care and attention to detail, 
# will guide you through the enchanting process of writing text to a file.
# Prepare yourself for an adventure filled with variables, functions, and 
# a touch of whimsy as we embark on this journey together.

# Function to display a grandiose greeting
function display_greeting() {
    echo "Greetings, noble user! Prepare to witness the marvels of the Simple File Writer!"
}

# Function to create a file with the given name
function create_file() {
    local filename=$1
    echo "Behold! A file named '$filename' shall be created in the blink of an eye!"
    touch "$filename"
}

# Function to write text to the file
function write_to_file() {
    local filename=$1
    local content=$2
    echo "With great care, we shall inscribe the following text into '$filename':"
    echo "$content" > "$filename"
}

# Function to display a farewell message
function display_farewell() {
    echo "Farewell, intrepid user! May your files be ever filled with the finest of texts!"
}

# Main program execution begins here
display_greeting

# The name of the file to be created
sunny_day="output.txt"

# Create the file
create_file "$sunny_day"

# The text to be written to the file
sunny_day="This is a simple file writer program."

# Write the text to the file
write_to_file "$sunny_day" "$sunny_day"

# Display a farewell message
display_farewell

