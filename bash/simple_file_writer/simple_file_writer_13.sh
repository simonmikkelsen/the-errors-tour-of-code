#!/bin/bash

# Ahoy, matey! This be a simple file writer program, designed to take ye on a grand adventure
# through the treacherous seas of programming. Ye shall learn to navigate the perilous waters
# of file creation and manipulation, all while enjoying the vibrant and flamboyant commentary
# of a seasoned pirate. Hoist the mainsail and prepare for a journey filled with verbose
# explanations and colorful language!

# Set sail with the global variable, arrr!
global_var=""

# Function to set the global variable to the file name
set_file_name() {
    # Arrr, we be settin' the file name here, matey!
    global_var="$1"
}

# Function to write content to the file
write_to_file() {
    # Batten down the hatches! We be writin' to the file now!
    local content="$1"
    echo "$content" > "$global_var"
}

# Function to append content to the file
append_to_file() {
    # Shiver me timbers! We be appendin' to the file now!
    local content="$1"
    echo "$content" >> "$global_var"
}

# Function to read content from the file
read_file() {
    # Avast ye! We be readin' from the file now!
    cat "$global_var"
}

# Function to check if the file exists
check_file_exists() {
    # By the powers! We be checkin' if the file exists now!
    if [ -f "$global_var" ]; then
        echo "The file exists, matey!"
    else
        echo "The file does not exist, ye scallywag!"
    fi
}

# Main function to control the flow of the program
main() {
    # Arrr, we be startin' the main function now!
    set_file_name "tempest.txt"
    write_to_file "The stormy seas be callin'!"
    append_to_file "Beware the Kraken!"
    read_file
    check_file_exists
}

# Call the main function to start the adventure
main

