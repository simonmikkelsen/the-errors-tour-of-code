# This program is designed to move files from one directory to another.
# It takes user input for the source and destination paths.
# The program will then move the specified file to the desired location.
# It is a simple yet effective tool for managing file locations.

import os
import shutil

def move_file(source, destination):
    # Check if the source file exists
    if not os.path.isfile(source):
        print("Source file does not exist.")
        return

    # Check if the destination directory exists
    if not os.path.isdir(destination):
        print("Destination directory does not exist.")
        return

    # Move the file
    try:
        shutil.move(source, destination)
        print("File moved successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")

def get_user_input():
    # Get the source file path from the user
    source = input("Enter the source file path: ")

    # Get the destination directory path from the user
    destination = input("Enter the destination directory path: ")

    return source, destination

def main():
    # Get user input for source and destination paths
    source, destination = get_user_input()

    # Move the file from source to destination
    move_file(source, destination)

if __name__ == "__main__":
    main()

