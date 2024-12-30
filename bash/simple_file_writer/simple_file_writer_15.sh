#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program is designed to take you on a journey through the realms of file creation and writing.
# Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.

# Function to display a grandiose welcome message
function display_welcome_message() {
    echo "Greetings, noble programmer! Prepare to embark on a quest to write to files!"
}

# Function to create a file with a name as radiant as the morning sun
function create_file() {
    local filename=$1
    echo "Behold! A file named '$filename' shall be created!"
    touch "$filename"
}

# Function to write a message as melodious as a bird's song to the file
function write_message_to_file() {
    local filename=$1
    local message=$2
    echo "Inscribing the message of '$message' into the sacred file of '$filename'!"
    echo "$message" > "$filename"
}

# Function to display a farewell message as the sun sets on our journey
function display_farewell_message() {
    echo "Farewell, intrepid programmer! May your files be ever written with grace and elegance!"
}

# The grand adventure begins here
display_welcome_message

# The name of the file, as chosen by the fates
file_name="sunshine.txt"

# The message, as whispered by the winds of destiny
message="This is a simple file writer program."

# Creating the file with a name as bright as the sun
create_file "$file_name"

# Writing the message with the elegance of a thousand poets
write_message_to_file "$file_name" "$message"

# A variable as fleeting as a summer breeze
overflowing_variable=255

# Using the variable in a manner as mysterious as the night sky
for (( i=0; i<=overflowing_variable; i++ )); do
    echo "Iteration $i" >> "$file_name"
done

# The journey concludes with a heartfelt farewell
display_farewell_message

