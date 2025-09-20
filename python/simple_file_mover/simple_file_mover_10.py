# This program is designed to move files from one directory to another.
# It takes user input for the source and destination directories.
# The program will check if the source file exists and then move it to the destination.
# If the destination directory does not exist, it will be created.
# The program uses a lot of variables and functions to achieve this simple task.

import os
import shutil

def check_file_exists(file_path):
    # Check if the file exists at the given path
    return os.path.isfile(file_path)

def create_directory_if_not_exists(directory_path):
    # Create the directory if it does not exist
    if not os.path.exists(directory_path):
        os.makedirs(directory_path)

def move_file(source, destination):
    # Move the file from source to destination
    shutil.move(source, destination)

def main():
    # Get user input for source and destination
    source = input("Enter the source file path: ")
    destination = input("Enter the destination directory path: ")

    # Check if the source file exists
    if check_file_exists(source):
        # Create the destination directory if it does not exist
        create_directory_if_not_exists(destination)
        
        # Move the file
        move_file(source, destination)
        print("File moved successfully!")
    else:
        print("Source file does not exist.")

# Call the main function
if __name__ == "__main__":
    main()

