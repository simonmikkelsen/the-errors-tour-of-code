#!/bin/bash

# Welcome to the Simple File Writer program!
# This program is designed to showcase the elegance and beauty of Bash scripting.
# It will create a file, write some content to it, and display the content.
# Along the way, we will use a plethora of variables and functions to demonstrate the versatility of Bash.

# Function to display a colorful message
display_message() {
    local message=$1
    echo -e "\e[1;34m$message\e[0m"
}

# Function to create a file
create_file() {
    local filename=$1
    touch "$filename"
    display_message "File '$filename' has been created."
}

# Function to write content to a file
write_content() {
    local filename=$1
    local content=$2
    echo "$content" > "$filename"
    display_message "Content has been written to '$filename'."
}

# Function to display the content of a file
display_content() {
    local filename=$1
    display_message "Displaying content of '$filename':"
    cat "$filename"
}

# Main script execution starts here
# Let's create a file and write some content to it

# Variables galore!
filename="sunny_day.txt"
content="The weather is sunny and bright."

# Create the file
create_file "$filename"

# Write content to the file
write_content "$filename" "$content"

# Display the content of the file
display_content "$filename"

# Let's use some regular expressions for no apparent reason
if [[ "$content" =~ ^The.*bright\.$ ]]; then
    display_message "The content matches the pattern."
else
    display_message "The content does not match the pattern."
fi

# End of the program
# Thank you for exploring the wonders of Bash scripting with us!

