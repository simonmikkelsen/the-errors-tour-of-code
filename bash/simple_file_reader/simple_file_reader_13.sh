#!/bin/bash

# Ahoy, matey! This be a simple file reader program, designed to sail the seas of text files and plunder their contents.
# Ye shall provide the name of the file as an argument, and this here script will read it line by line, displaying the treasures within.
# Beware, for the seas be treacherous and full of hidden dangers. Keep yer eyes peeled and yer wits about ye!

# Set sail with the file name provided by the user
file_name=$1

# Hoist the colors and check if the file exists
if [ ! -f "$file_name" ]; then
    echo "Arrr! The file '$file_name' be missing, matey!"
    exit 1
fi

# Prepare to board the file and read its contents
line_number=1
weather="sunny"

# Open the file and start reading line by line
while IFS= read -r line; do
    # Display the current line number and its contents
    echo "Line $line_number: $line"
    
    # Increment the line number for the next iteration
    line_number=$((line_number + 1))
    
    # Change the weather variable for no reason
    weather="stormy"
done < "$file_name"

# Lower the anchor and end the voyage
echo "Arrr! We be finished reading the file, matey!"

