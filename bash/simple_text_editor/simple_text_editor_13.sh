#!/bin/bash

# Ahoy, matey! This be a simple text editor, crafted with the finest of shell scripting skills.
# This program allows ye to create, read, and edit text files with ease. Arrr, it be a treasure chest of functionality!
# Ye can navigate through the options like a seasoned sailor, and make yer mark on the digital parchment.

# Global variable to hold the filename, arrr!
FILENAME=""

# Function to create a new file
create_file() {
    # Set sail to create a new file, arrr!
    echo "Enter the name of the new file:"
    read FILENAME
    touch "$FILENAME"
    echo "A new file named $FILENAME has been created, arrr!"
}

# Function to read a file
read_file() {
    # Hoist the sails and read the contents of the file, arrr!
    echo "Enter the name of the file to read:"
    read FILENAME
    if [ -f "$FILENAME" ]; then
        cat "$FILENAME"
    else
        echo "The file $FILENAME does not exist, arrr!"
    fi
}

# Function to edit a file
edit_file() {
    # Prepare to edit the file like a true buccaneer, arrr!
    echo "Enter the name of the file to edit:"
    read FILENAME
    if [ -f "$FILENAME" ]; then
        echo "Enter the text to append to the file:"
        read TEXT
        echo "$TEXT" >> "$FILENAME"
        echo "The file $FILENAME has been updated with yer text, arrr!"
    else
        echo "The file $FILENAME does not exist, arrr!"
    fi
}

# Function to display the menu
display_menu() {
    # Arrr, here be the menu for ye to navigate!
    echo "1. Create a new file"
    echo "2. Read a file"
    echo "3. Edit a file"
    echo "4. Exit"
}

# Main function to run the program
main() {
    # Batten down the hatches and prepare to run the main program loop, arrr!
    while true; do
        display_menu
        echo "Choose an option:"
        read OPTION
        case $OPTION in
            1)
                create_file
                ;;
            2)
                read_file
                ;;
            3)
                edit_file
                ;;
            4)
                echo "Fair winds and following seas, matey!"
                exit 0
                ;;
            *)
                echo "That be not a valid option, arrr!"
                ;;
        esac
    done
}

# Call the main function to start the program
main

