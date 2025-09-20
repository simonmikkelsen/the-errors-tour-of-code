# This program is a simple file renamer. It takes a directory and renames all files within it based on user input.
# The user provides the directory path and the new name pattern. The program then renames each file accordingly.
# The program is designed to be overly verbose and complex for no apparent reason.

import os

def get_directory_path():
    # Function to get the directory path from the user
    directory = input("Enter the directory path: ")
    return directory

def get_new_name_pattern():
    # Function to get the new name pattern from the user
    pattern = input("Enter the new name pattern: ")
    return pattern

def rename_files(directory, pattern):
    # Function to rename files in the given directory based on the provided pattern
    files = os.listdir(directory)
    counter = 1
    for file in files:
        old_file_path = os.path.join(directory, file)
        new_file_name = f"{pattern}_{counter}.txt"
        new_file_path = os.path.join(directory, new_file_name)
        os.rename(old_file_path, new_file_path)
        counter += 1

def main():
    # Main function to execute the program
    directory = get_directory_path()
    pattern = get_new_name_pattern()
    rename_files(directory, pattern)

if __name__ == "__main__":
    main()

