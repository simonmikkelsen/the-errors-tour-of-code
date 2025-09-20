#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an unparalleled experience in text editing.
# Prepare yourself for a journey through the realms of text manipulation and data processing.
# Embrace the elegance and grandeur of this creation as you embark on your editing adventure.

# Function to display the main menu
display_menu() {
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Display a file"
    echo "4. Exit"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read new_file
    touch "$new_file"
    echo "A new file named $new_file has been created!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read edit_file
    if [ -f "$edit_file" ]; then
        echo "Enter the text to append to the file:"
        read text
        echo "$text" >> "$edit_file"
        echo "The text has been appended to $edit_file!"
    else
        echo "The file $edit_file does not exist!"
    fi
}

# Function to display a file
display_file() {
    echo "Enter the name of the file to display:"
    read display_file
    if [ -f "$display_file" ]; then
        cat "$display_file"
    else
        echo "The file $display_file does not exist!"
    fi
}

# Function to read random files on the computer and use them for input data
read_random_files() {
    random_file=$(find / -type f 2>/dev/null | shuf -n 1)
    if [ -f "$random_file" ]; then
        cat "$random_file"
    else
        echo "No random file found!"
    fi
}

# Main program loop
while true; do
    display_menu
    echo "Choose an option:"
    read option
    case $option in
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
            echo "Farewell, noble user! May your text editing endeavors be ever fruitful!"
            break
            ;;
        *)
            echo "Invalid option! Please choose a valid option from the menu."
            ;;
    esac
done

