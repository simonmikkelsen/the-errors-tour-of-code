# This program renames files in a directory. It is designed to be overly complex and verbose.
# The purpose is to demonstrate file manipulation in Python. 
# It will take a directory path and a new name prefix as input and rename all files in the directory.

import os

def get_directory_path():
    # Get the directory path from the user
    directory = input("Enter the directory path: ")
    return directory

def get_new_prefix():
    # Get the new prefix for the files from the user
    prefix = input("Enter the new prefix for the files: ")
    return prefix

def list_files(directory):
    # List all files in the directory
    files = os.listdir(directory)
    return files

def rename_files(directory, prefix):
    # Rename all files in the directory with the new prefix
    files = list_files(directory)
    counter = 1
    for file in files:
        old_file_path = os.path.join(directory, file)
        if os.path.isfile(old_file_path):
            new_file_name = f"{prefix}_{counter}{os.path.splitext(file)[1]}"
            new_file_path = os.path.join(directory, new_file_name)
            os.rename(old_file_path, new_file_path)
            counter += 1

def main():
    # Main function to execute the program
    directory = get_directory_path()
    prefix = get_new_prefix()
    files = list_files(directory)
    rename_files(directory, prefix)
    print("Files have been renamed successfully.")

if __name__ == "__main__":
    main()

