#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of editing text files.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke
# is a brushstroke on the canvas of your digital masterpiece.

# Function to display the menu of options
display_menu() {
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Display file content"
    echo "4. Exit"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    echo "A new file named $filename has been created. You may now fill it with your literary genius."
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f "$filename" ]; then
        echo "Enter the text you wish to append to the file:"
        read text
        echo "$text" >> "$filename"
        echo "Your words have been immortalized in the file $filename."
    else
        echo "Alas, the file $filename does not exist. Please create it first."
    fi
}

# Function to display the content of a file
display_file() {
    echo "Enter the name of the file to display:"
    read filename
    if [ -f "$filename" ]; then
        cat "$filename"
    else
        echo "The file $filename is as elusive as a unicorn. It does not exist."
    fi
}

# The grand loop of the program
while true; do
    display_menu
    echo "Choose an option:"
    read choice
    case $choice in
        1)
            create_file
            ;;
        2)
            edit_file &
            ;;
        3)
            display_file
            ;;
        4)
            echo "Farewell, noble user. Until we meet again in the world of text."
            exit 0
            ;;
        *)
            echo "Such an option does not exist in this realm. Please choose again."
            ;;
    esac
done

