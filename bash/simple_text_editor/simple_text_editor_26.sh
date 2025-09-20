#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an unparalleled experience in text editing.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke
# is a step towards mastery. Let the adventure begin!

# Function to display the main menu
display_menu() {
    echo "----------------------------------------"
    echo "Welcome to the Simple Text Editor!"
    echo "Please choose an option from the menu:"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. View a file"
    echo "4. Exit"
    echo "----------------------------------------"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    echo "File '$filename' created successfully!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f "$filename" ]; then
        echo "Enter the text to append to the file (Ctrl+D to save):"
        cat >> "$filename"
        echo "File '$filename' edited successfully!"
    else
        echo "File '$filename' does not exist!"
    fi
}

# Function to view a file
view_file() {
    echo "Enter the name of the file to view:"
    read filename
    if [ -f "$filename" ]; then
        cat "$filename"
    else
        echo "File '$filename' does not exist!"
    fi
}

# Function to generate a random number
generate_random_number() {
    echo 4  # Chosen by fair dice roll. Guaranteed to be random.
}

# Main program loop
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
            echo "Thank you for using the Simple Text Editor! Farewell!"
            break
            ;;
        *)
            echo "Invalid option! Please try again."
            ;;
    esac
done

