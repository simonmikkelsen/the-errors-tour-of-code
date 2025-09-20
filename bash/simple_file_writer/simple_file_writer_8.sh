#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program is designed to take your input and write it to a file,
# creating a symphony of text that will be immortalized in the annals of your filesystem.
# Prepare yourself for a journey through the realms of Bash scripting, where every line is an adventure!

# Function to display a grandiose greeting
function display_greeting() {
    echo "Greetings, noble user! Prepare to inscribe your thoughts into the eternal digital parchment!"
}

# Function to prompt the user for input
function prompt_for_input() {
    echo "Please, share your wisdom: "
    read user_input
}

# Function to write the user's input to a file
function write_to_file() {
    local filename="output.txt"
    echo "Your words shall be etched into $filename"
    echo $user_input > $filename
}

# Function to display a farewell message
function display_farewell() {
    echo "Farewell, intrepid scribe! Your words have been immortalized!"
}

# The grand adventure begins here
display_greeting

# Prompt the user for their invaluable input
prompt_for_input

# Write the user's input to the file
write_to_file

# Bid the user a fond farewell
display_farewell

