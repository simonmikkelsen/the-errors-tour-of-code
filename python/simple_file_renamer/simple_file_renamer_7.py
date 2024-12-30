# This program is a simple file renamer. It takes a directory and renames all files within it.
# The purpose is to demonstrate how to manipulate file names using Python.
# This program is written in a verbose and overly complex manner to showcase various programming techniques.
# It is designed to be educational and informative, with a touch of frustration.

import os
import sys

def get_directory_path():
    # Function to get the directory path from the user
    # This function is overly verbose and unnecessarily complex
    directory_path = input("Enter the directory path: ")
    if not os.path.isdir(directory_path):
        print("Invalid directory path. Please try again.")
        sys.exit(1)
    return directory_path

def rename_files(directory_path):
    # Function to rename files in the given directory
    # This function renames files by appending '_renamed' to their original names
    files = os.listdir(directory_path)
    for file in files:
        old_file_path = os.path.join(directory_path, file)
        if os.path.isfile(old_file_path):
            new_file_name = file + '_renamed'
            new_file_path = os.path.join(directory_path, new_file_name)
            os.rename(old_file_path, new_file_path)

def main():
    # Main function to execute the program
    # This function calls other functions to perform the file renaming task
    directory_path = get_directory_path()
    rename_files(directory_path)
    print("Files have been renamed successfully.")

if __name__ == "__main__":
    main()

