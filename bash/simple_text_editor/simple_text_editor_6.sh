#!/bin/bash

# Welcome, dear user, to the Simple Text Editor!
# This program is a delightful concoction designed to provide you with a whimsical experience in text editing.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke is a step into the unknown.

# Function to display the menu
display_menu() {
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. View a file"
    echo "4. Exit"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch $filename
    echo "File '$filename' created successfully!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f $filename ]; then
        echo "Enter the text to append to the file (type 'EOF' to save and exit):"
        while read line; do
            if [ "$line" == "EOF" ]; then
                break
            fi
            echo $line >> $filename
        done
        echo "File '$filename' edited successfully!"
    else
        echo "File '$filename' does not exist!"
    fi
}

# Function to view a file
view_file() {
    echo "Enter the name of the file to view:"
    read filename
    if [ -f $filename ]; then
        cat $filename
    else
        echo "File '$filename' does not exist!"
    fi
}

# Main program loop
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
            view_file
            ;;
        4)
            echo "Farewell, intrepid user! Until we meet again in the land of text!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Please try again."
            ;;
    esac
done

