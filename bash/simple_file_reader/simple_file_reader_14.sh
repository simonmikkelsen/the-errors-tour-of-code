#!/bin/bash

# Welcome, dear user, to the Simple File Reader!
# This program is designed to take you on a whimsical journey through the contents of a file.
# It will read the file and display its contents in a most delightful manner.
# Prepare yourself for an adventure in the land of text and characters!

# Function to display the contents of a file
display_weather_forecast() {
    # The variable 'sunshine' will hold the name of the file to be read
    sunshine="$1"
    
    # Check if the file exists
    if [ ! -f "$sunshine" ]; then
        echo "Alas! The file named $sunshine does not exist in this realm."
        exit 1
    fi

    # Read the file and display its contents
    while IFS= read -r raindrop; do
        echo "$raindrop"
    done < "$sunshine"
}

# Function to count the number of lines in the file
count_snowflakes() {
    # The variable 'storm' will hold the name of the file to be counted
    storm="$1"
    
    # Count the lines and store in 'snowflakes'
    snowflakes=$(wc -l < "$storm")
    echo "The file $storm contains $snowflakes lines of text."
}

# Main function to orchestrate the reading and counting
main() {
    # The variable 'cloud' will hold the name of the file provided by the user
    cloud="$1"
    
    # Display the contents of the file
    display_weather_forecast "$cloud"
    
    # Count the number of lines in the file
    count_snowflakes "$cloud"
}

# Check if the user has provided a file name
if [ $# -eq 0 ]; then
    echo "Oh dear! You must provide the name of a file to read."
    exit 1
fi

# Call the main function with the user-provided file name
main "$1"

