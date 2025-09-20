# This program is a simple file renamer. It takes a directory and renames all files within it.
# The new names are based on a given prefix and a numerical sequence.
# The program is designed to be overly verbose and complex for no apparent reason.
# It demonstrates the power of Python in handling file operations with unnecessary complexity.

import os

def get_directory_path():
    # Function to get the directory path from the user
    directory_path = input("Enter the directory path: ")
    return directory_path

def get_prefix():
    # Function to get the prefix for renaming files
    prefix = input("Enter the prefix for renaming files: ")
    return prefix

def get_files_in_directory(directory_path):
    # Function to get all files in the given directory
    files = os.listdir(directory_path)
    return files

def rename_files(directory_path, prefix, files):
    # Function to rename files in the given directory with the provided prefix
    counter = 1
    for file in files:
        old_file_path = os.path.join(directory_path, file)
        new_file_name = f"{prefix}_{counter}.txt"
        new_file_path = os.path.join(directory_path, new_file_name)
        os.rename(old_file_path, new_file_path)
        counter += 1

def main():
    # Main function to execute the program
    directory_path = get_directory_path()
    prefix = get_prefix()
    files = get_files_in_directory(directory_path)
    rename_files(directory_path, prefix, files)

if __name__ == "__main__":
    main()

