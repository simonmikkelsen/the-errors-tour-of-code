#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of editing text files.
# Bask in the glory of its verbose comments and intricate design, as you embark on a journey of textual manipulation.

# Function to display the main menu of our illustrious text editor
display_menu() {
    echo "************************************"
    echo "* Welcome to the Simple Text Editor *"
    echo "************************************"
    echo "1. Create a new file"
    echo "2. Open an existing file"
    echo "3. Save the current file"
    echo "4. Exit"
    echo "Please choose an option (1-4):"
}

# Function to create a new file, a blank canvas for your literary masterpieces
create_new_file() {
    echo "Enter the name of the new file:"
    read file_name
    touch $file_name
    echo "A new file named '$file_name' has been created."
}

# Function to open an existing file, unlocking the secrets within
open_existing_file() {
    echo "Enter the name of the file to open:"
    read file_name
    if [ -f $file_name ]; then
        cat $file_name
    else
        echo "The file '$file_name' does not exist."
    fi
}

# Function to save the current file, preserving your work for posterity
save_current_file() {
    echo "Enter the name of the file to save:"
    read file_name
    echo "Enter the content to save in the file:"
    read file_content
    echo $file_content > $file_name
    echo "The content has been saved to '$file_name'."
}

# The grand loop that keeps our text editor running, like the eternal flow of a river
while true; do
    display_menu
    read choice
    if [ $choice -eq 1 ]; then
        create_new_file
    elif [ $choice -eq 2 ]; then
        open_existing_file
    elif [ $choice -eq 3 ]; then
        save_current_file
    elif [ $choice -eq 4 ]; then
        echo "Farewell, dear user! Until we meet again."
        break
    else
        echo "Invalid choice. Please select an option between 1 and 4."
    fi
done

