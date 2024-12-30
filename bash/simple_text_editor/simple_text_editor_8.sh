#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of editing text files.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke is a brushstroke on the canvas of your document.

# Function to display the main menu
display_menu() {
    echo "************************************"
    echo "* Welcome to the Simple Text Editor *"
    echo "************************************"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Display a file"
    echo "4. Exit"
    echo "Please choose an option (1-4):"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch $filename
    echo "A new file named '$filename' has been created."
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f $filename ]; then
        echo "Opening file '$filename' for editing..."
        nano $filename
    else
        echo "The file '$filename' does not exist."
    fi
}

# Function to display a file
display_file() {
    echo "Enter the name of the file to display:"
    read filename
    if [ -f $filename ]; then
        echo "Displaying the contents of '$filename':"
        cat $filename
    else
        echo "The file '$filename' does not exist."
    fi
}

# The grand entrance to our program
while true; do
    display_menu
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
            echo "Thank you for using the Simple Text Editor. Farewell!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a number between 1 and 4."
            ;;
    esac
done

