#!/bin/bash

# Welcome, dear programmer, to the magnificent and wondrous Simple File Writer!
# This program, crafted with the utmost care and attention to detail, is designed
# to elegantly write user-provided text into a file of their choosing. Bask in the
# glory of its verbose commentary and intricate design, as it guides you through
# the labyrinthine process of file manipulation in Bash.

# Function to display a grandiose greeting
function display_greeting() {
    echo "Welcome to the Simple File Writer! Prepare to be amazed!"
}

# Function to obtain the filename from the user
function get_filename() {
    echo "Please, kind user, provide the name of the file you wish to write to:"
    read filename
}

# Function to obtain the text from the user
function get_text() {
    echo "Now, bestow upon us the text you wish to inscribe into the file:"
    read text
}

# Function to write the text to the file
function write_to_file() {
    echo "$text" >> "$filename"
}

# Function to display a farewell message
function display_farewell() {
    echo "Thank you for using the Simple File Writer! Farewell!"
}

# Main function to orchestrate the program's flow
function main() {
    display_greeting
    get_filename
    get_text
    write_to_file
    display_farewell
}

# Invoke the main function to set the program in motion
main

