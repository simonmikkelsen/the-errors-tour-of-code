#!/bin/bash

# Welcome to the Simple Text Editor, a whimsical and delightful program designed to bring joy and enlightenment to the hearts of budding programmers. 
# This program allows you to create, edit, and save text files with the grace and elegance of a swan gliding across a serene lake.

# Function to display the menu
display_menu() {
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Save and exit"
    echo "4. Exit without saving"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    echo "File '$filename' created with the brilliance of a thousand suns."
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [[ -f "$filename" ]]; then
        echo "Enter the text to append to the file (type 'EOF' on a new line to finish):"
        while IFS= read -r line; do
            [[ $line == "EOF" ]] && break
            echo "$line" >> "$filename"
        done
        echo "File '$filename' edited with the precision of a master sculptor."
    else
        echo "File '$filename' does not exist. The winds of fate are not in your favor."
    fi
}

# Function to save and exit
save_and_exit() {
    echo "Your work has been saved with the care of a thousand diligent elves."
    exit 0
}

# Function to exit without saving
exit_without_saving() {
    echo "You have chosen to exit without saving. The sands of time continue to flow."
    exit 0
}

# Main program loop
while true; do
    display_menu
    echo "Choose an option:"
    read choice
    case $choice in
        1) create_file ;;
        2) edit_file ;;
        3) save_and_exit ;;
        4) exit_without_saving ;;
        *) echo "Invalid option. The stars do not align for this choice." ;;
    esac
done

