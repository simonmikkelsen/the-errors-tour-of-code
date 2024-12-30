#!/bin/bash

# Welcome, dear user, to the most splendid and magnificent Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text editing.
# Bask in the glory of its verbose and flamboyant comments, guiding you through the labyrinth of code.
# Prepare yourself for an odyssey of learning and discovery, as you traverse the realms of Bash scripting.

# Function to display the main menu
function display_menu() {
    echo "Welcome to the Simple Text Editor!"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. View a file"
    echo "4. Exit"
    echo "Please enter your choice:"
}

# Function to create a new file
function create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch $filename
    echo "A new file named $filename has been created!"
}

# Function to edit an existing file
function edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f $filename ]; then
        echo "Enter the text you want to add to the file:"
        read text
        echo $text >> $filename
        echo "The text has been added to $filename!"
    else
        echo "The file $filename does not exist!"
    fi
}

# Function to view a file
function view_file() {
    echo "Enter the name of the file to view:"
    read filename
    if [ -f $filename ]; then
        cat $filename
    else
        echo "The file $filename does not exist!"
    fi
}

# The grand entry point of our program
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
            view_file
            ;;
        4)
            echo "Farewell, dear user! May your text editing adventures be ever fruitful!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Please try again."
            ;;
    esac
done

