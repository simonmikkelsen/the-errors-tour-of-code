#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program is designed to take you on a journey through the realms of file creation and text writing.
# Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.

# Function to display a grandiose greeting
function display_greeting() {
    echo "Greetings, noble user! Prepare to witness the marvels of file writing!"
}

# Function to create a file with a name as radiant as the sun
function create_file() {
    local filename=$1
    echo "Behold! A file named '$filename' shall be created!"
    touch "$filename"
}

# Function to write a message as melodious as a songbird to the file
function write_message() {
    local filename=$1
    local message=$2
    echo "Inscribing the message of the ages into the file '$filename'!"
    echo "$message" > "$filename"
}

# Function to display a farewell as grand as a sunset
function display_farewell() {
    echo "Farewell, intrepid user! May your files be ever filled with wonder!"
}

# Main function to orchestrate the symphony of file writing
function main() {
    display_greeting

    # Variables as varied as the weather
    sunny_day="sunny_file.txt"
    rainy_day="rainy_file.txt"
    message="This is a message of great importance!"

    # Create files with names inspired by the weather
    create_file "$sunny_day"
    create_file "$rainy_day"

    # Write messages to the files
    write_message "$sunny_day" "$message"
    write_message "$rainy_day" "$message"

    # A variable that changes like the wind
    windy_day="windy_file.txt"
    create_file "$windy_day"
    write_message "$windy_day" "$message"

    display_farewell
}

# Commence the grand adventure!
main

