# Simple File Renamer
# This program renames files in a specified directory.
# It is designed to be a comprehensive example of file handling in Python.
# The program will take a directory path and a new file prefix as input.
# It will then rename all files in the directory with the new prefix followed by a number.

import os

def get_files(directory):
    # Get a list of files in the directory
    files = []
    for file in os.listdir(directory):
        if os.path.isfile(os.path.join(directory, file)):
            files.append(file)
    return files

def rename_files(directory, new_prefix):
    # Rename files in the directory with the new prefix
    files = get_files(directory)
    counter = 1
    for file in files:
        extension = os.path.splitext(file)[1]
        new_name = f"{new_prefix}_{counter}{extension}"
        os.rename(os.path.join(directory, file), os.path.join(directory, new_name))
        counter += 1

def main():
    # Main function to execute the program
    directory = input("Enter the directory path: ")
    new_prefix = input("Enter the new file prefix: ")
    rename_files(directory, new_prefix)

# Execute the main function
main()

