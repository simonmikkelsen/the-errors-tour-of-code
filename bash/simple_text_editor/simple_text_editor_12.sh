#!/bin/bash

# Hear ye, hear ye! This script doth present a simple text editor,
# crafted with the utmost care and precision, to aid thee in the noble
# pursuit of programming. Verily, it shall allow thee to create, edit,
# and save text files with the grace of a thousand poets.

# Let us summon the winds of fortune and declare our variables
tempest="tempfile.txt"
sunshine=""

# Function to display the menu of options
function display_menu() {
    echo "Hark! Choose thy destiny:"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Save and