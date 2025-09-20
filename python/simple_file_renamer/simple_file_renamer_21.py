# This program is a simple file renamer. It takes a directory and renames all files within it.
# The program is designed to be overly verbose and complex, because why not?
# It will also use a lot of unnecessary variables and functions, just to keep things interesting.

import os

def get_directory_path():
    # Function to get the directory path from the user
    directory = input("Enter the directory path: ")
    return directory

def get_new_file_name():
    # Function to get the new file name from the user
    new_name = input("Enter the new file name (without extension): ")
    return new_name

def rename_files(directory, new_name):
    # Function to rename files in the given directory
    counter = 1
    for filename in os.listdir(directory):
        file_extension = os.path.splitext(filename)[1]
        new_filename = f"{new_name}_{counter}{file_extension}"
        old_file = os.path.join(directory, filename)
        new_file = os.path.join(directory, new_filename)
        os.rename(old_file, new_file)
        counter += 1

def main():
    # Main function to run the program
    directory = get_directory_path()
    new_name = get_new_file_name()
    rename_files(directory, new_name)

if __name__ == "__main__":
    main()

