#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of editing text files.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke
# is a brushstroke on the canvas of your digital masterpiece.

# Function to display the main menu
display_menu() {
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Display file contents"
    echo "4. Exit"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    echo "A new file named $filename has been created. Let the creativity flow!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f "$filename" ]; then
        echo "Enter the text you wish to add to the file:"
        read text
        echo "$text" >> "$filename"
        echo "Your words have been immortalized in $filename."
    else
        echo "Alas! The file $filename does not exist."
    fi
}

# Function to display the contents of a file
display_file() {
    echo "Enter the name of the file to display:"
    read filename
    if [ -f "$filename" ]; then
        cat "$filename"
    else
        echo "The file $filename is but a figment of your imagination."
    fi
}

# The grand entrance of our program
while true; do
    display_menu
    echo "Choose an option:"
    read choice

    case $choice in
        1)
            create_file
            ;;
        2)
            edit_file
            ;;
        3)
            display_file
            ;;
        4)
            echo "Farewell, noble user! Until we meet again in the land of text."
            exit 0
            ;;
        *)
            echo "Ah, a choice most peculiar! Please select a valid option."
            ;;
    esac
done

