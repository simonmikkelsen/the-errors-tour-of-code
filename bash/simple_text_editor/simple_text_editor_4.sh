#!/bin/bash

# Welcome, dear user, to the most splendid and magnificent Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text editing.
# Bask in the glory of its verbose and flamboyant comments, guiding you through the labyrinth of code.

# Behold the variables of grandeur!
sunshine="Welcome to the Simple Text Editor!"
rain="Please enter the name of the file you wish to edit: "
storm="Enter your text below. To save and exit, type 'SAVE' on a new line."

# Display the welcome message
echo "$sunshine"

# Prompt the user for the filename
echo "$rain"
read filename

# Create or open the file for editing
touch "$filename"

# Prepare the user for the text entry
echo "$storm"

# Initialize the text variable
text=""

# Infinite loop to capture user input
while true; do
    # Read user input
    read line
    # Check if the user wants to save and exit
    if [ "$line" == "SAVE" ]; then
        break
    fi
    # Append the line to the text variable
    text="$text$line\n"
done

# Save the text to the file
echo -e "$text" > "$filename"

# Bid farewell to the user
echo "Your text has been saved to $filename. Farewell, noble user!"

