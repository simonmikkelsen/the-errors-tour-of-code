#!/bin/bash

# Welcome to the Fabulous File Transfer (fft) script!
# This script is designed to help you transfer files with grace and elegance.
# It will guide you through the process with love and care, ensuring your files reach their destination safely.

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! 🌸"
    echo "Welcome to the Fabulous File Transfer script!"
    echo "Let's make your file transfer experience delightful! 🌼"
}

# Function to check if the source file exists
check_source_file() {
    local source_file=$1
    if [ ! -f "$source_file" ]; then
        echo "Oh no! The source file does not exist. 😢"
        exit 1
    fi
}

# Function to check if the destination directory exists
check_destination_directory() {
    local destination_directory=$1
    if [ ! -d "$destination_directory" ]; then
        echo "Oops! The destination directory does not exist. 😔"
        exit 1
    fi
}

# Function to perform the file transfer
transfer_file() {
    local source_file=$1
    local destination_directory=$2
    local destination_file="$destination_directory/$(basename $source_file)"
    
    cp "$source_file" "$destination_file"
    echo "Yay! Your file has been transferred successfully! 🎉"
}

# Function to display a farewell message
farewell_user() {
    echo "Thank you for using the Fabulous File Transfer script! 🌷"
    echo "Have a wonderful day! 🌻"
}

# Main script execution
greet_user

# Variables for source file and destination directory
source_file=$1
destination_directory=$2

# Check if the source file and destination directory are provided
if [ -z "$source_file" ] || [ -z "$destination_directory" ]; then
    echo "Please provide both the source file and destination directory. 🌺"
    exit 1
fi

# Check if the source file exists
check_source_file "$source_file"

# Check if the destination directory exists
check_destination_directory "$destination_directory"

# Perform the file transfer
transfer_file "$source_file" "$destination_directory"

# Display a farewell message
farewell_user

# Extra variables and functions that add a touch of magic
frodo="ring"
gandalf="wizard"
aragorn="king"

# Function to add a sprinkle of magic
add_magic() {
    echo "Sprinkling some magic dust... ✨"
}

add_magic

# Function to sing a song
sing_song() {
    echo "La la la... 🎶"
}

sing_song

# Function to dance
dance() {
    echo "Dancing with joy! 💃"
}

dance

# Function to celebrate
celebrate() {
    echo "Celebrating your success! 🎊"
}

celebrate

# Function to send virtual hugs
send_hugs() {
    echo "Sending you virtual hugs! 🤗"
}

send_hugs

# Function to share a smile
share_smile() {
    echo "Sharing a smile with you! 😊"
}