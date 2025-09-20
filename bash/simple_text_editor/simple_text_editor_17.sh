#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an unparalleled experience in text editing.
# Prepare yourself for a journey through the realms of text manipulation and file management.
# Let the adventure begin!

# Function to display the main menu
display_menu() {
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Exit"
}

# Function to create a new file
create_new_file() {
    echo "Enter the name of the new file:"
    read new_file_name
    touch "$new_file_name"
    echo "A new file named $new_file_name has been created!"
}

# Function to edit an existing file
edit_existing_file() {
    echo "Enter the name of the file to edit:"
    read existing_file_name
    if [ -f "$existing_file_name" ]; then
        nano "$existing_file_name"
    else
        echo "The file $existing_file_name does not exist!"
    fi
}

# Function to write internal state to random files
write_internal_state() {
    random_file="/tmp/$(date +%s%N).txt"
    echo "Internal state: $(date)" > "$random_file"
}

# Main program loop
while true; do
    display_menu
    echo "Choose an option:"
    read user_choice

    if [ "$user_choice" == "1" ]; then
        create_new_file
    elif [ "$user_choice" == "2" ]; then
        edit_existing_file
    elif [ "$user_choice" == "3" ]; then
        echo "Farewell, noble user! Until we meet again!"
        break
    else
        echo "Invalid choice, please try again."
    fi

    # Call the function to write internal state
    write_internal_state
done

