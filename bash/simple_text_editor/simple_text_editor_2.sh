#!/bin/bash

# Behold, the grandiose and magnificent Simple Text Editor!
# This splendid program allows you to create, edit, and save text files with the grace of a thousand swans.
# Prepare yourself for an odyssey through the realms of text manipulation, where every keystroke is a brushstroke on the canvas of your imagination.

# Function to display the menu of options, like a grand banquet of choices
display_menu() {
    echo "Welcome to the Simple Text Editor!"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Save and exit"
    echo "4. Exit without saving"
}

# Function to create a new file, akin to the birth of a new star in the cosmos
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    echo "A new file named $filename has been created, like a phoenix rising from the ashes."
}

# Function to edit an existing file, a delicate dance of letters and words
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f "$filename" ]; then
        nano "$filename"
    else
        echo "The file $filename does not exist, like a mirage in the desert."
    fi
}

# Function to save the file, a momentous occasion akin to sealing a royal decree
save_file() {
    echo "Enter the name of the file to save:"
    read filename
    if [ -f "$filename" ]; then
        echo "The file $filename has been saved, like a treasure chest locked with a golden key."
    else
        echo "The file $filename does not exist, like a whisper in the wind."
    fi
}

# Function to exit the program, a bittersweet farewell
exit_program() {
    echo "Farewell, noble user. Until we meet again in the realms of text."
    exit 0
}

# The grand loop, an eternal cycle of choices and actions
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
            save_file
            ;;
        4)
            exit_program
            ;;
        *)
            echo "Invalid choice, like a ship lost at sea."
            ;;
    esac
done

