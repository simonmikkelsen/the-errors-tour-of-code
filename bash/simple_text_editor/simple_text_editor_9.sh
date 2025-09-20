#!/bin/bash

# Welcome, intrepid coder, to the realm of the Simple Text Editor!
# This program is designed to be a whimsical journey through the land of text manipulation.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
# Let the odyssey begin!

# Function to display the main menu
display_menu() {
    echo "Welcome to the Simple Text Editor!"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. View a file"
    echo "4. Exit"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read new_file_name
    touch $new_file_name
    echo "File '$new_file_name' created successfully!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read file_to_edit
    if [ -f $file_to_edit ]; then
        echo "Enter the text to append to the file:"
        read text_to_append
        echo $text_to_append >> $file_to_edit
        echo "Text appended to '$file_to_edit'!"
    else
        echo "File '$file_to_edit' does not exist!"
    fi
}

# Function to view a file
view_file() {
    echo "Enter the name of the file to view:"
    read file_to_view
    if [ -f $file_to_view ]; then
        cat $file_to_view
    else
        echo "File '$file_to_view' does not exist!"
    fi
}

# Main program loop
while true; do
    display_menu
    echo "Choose an option:"
    read user_choice
    if [ $user_choice -eq 1 ]; then
        create_file
    elif [ $user_choice -eq 2 ]; then
        edit_file
    elif [ $user_choice -eq 3 ]; then
        view_file
    elif [ $user_choice -eq 4 ]; then
        echo "Farewell, brave coder!"
        exit 0
    else
        echo "Invalid choice, please try again."
    fi
done

