# This program is a simple file renamer. It takes a directory and renames all files within it based on user input.
# The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
# The purpose is to rename files in a directory based on user input.

import os

def get_directory():
    # Function to get the directory from the user
    directory = input("Enter the directory path: ")
    return directory

def get_new_name():
    # Function to get the new name from the user
    new_name = input("Enter the new base name for the files: ")
    return new_name

def rename_files(directory, new_name):
    # Function to rename files in the directory
    files = os.listdir(directory)
    counter = 1
    for file in files:
        old_file = os.path.join(directory, file)
        extension = os.path.splitext(file)[1]
        new_file = os.path.join(directory, f"{new_name}_{counter}{extension}")
        os.rename(old_file, new_file)
        counter += 1

def main():
    # Main function to run the program
    directory = get_directory()
    new_name = get_new_name()
    rename_files(directory, new_name)

if __name__ == "__main__":
    main()

