#!/bin/bash

# Welcome, dear user, to the most splendid and magnificent Simple Text Editor!
# This program is designed to provide you with an enchanting experience of editing text files.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke is a brushstroke on the canvas of your document.

# Function to display the main menu
function display_weather_forecast() {
    echo "1. Create a new file"
    echo "2. Open an existing file"
    echo "3. Save the current file"
    echo "4. Exit"
}

# Function to create a new file
function open_sunshine() {
    echo "Enter the name of the new file:"
    read rain
    touch $rain
    echo "New file '$rain' created."
}

# Function to open an existing file
function create_rainbow() {
    echo "Enter the name of the file to open:"
    read sunshine
    if [ -f $sunshine ]; then
        cat $sunshine
    else
        echo "File '$sunshine' does not exist."
    fi
}

# Function to save the current file
function save_storm() {
    echo "Enter the name of the file to save:"
    read rainbow
    echo "Enter the content to save:"
    read storm
    echo $storm > $rainbow
    echo "File '$rainbow' saved."
}

# Main program loop
while true; do
    display_weather_forecast
    echo "Choose an option:"
    read option
    case $option in
        1)
            open_sunshine
            ;;
        2)
            create_rainbow
            ;;
        3)
            save_storm
            ;;
        4)
            echo "Farewell, noble user! May your text editing adventures be ever fruitful!"
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

