# This program is a simple file renamer. It takes a directory and renames all files within it.
# The renaming pattern is specified by the user. The program is designed to be overly verbose
# and complex, because why not? Let's make things interesting.

import os

def get_directory():
    # Function to get the directory from the user
    directory = input("Enter the directory path: ")
    return directory

def get_rename_pattern():
    # Function to get the renaming pattern from the user
    pattern = input("Enter the renaming pattern (use {} for numbering): ")
    return pattern

def rename_files(directory, pattern):
    # Function to rename files in the specified directory
    files = os.listdir(directory)
    count = 1
    for file in files:
        old_file = os.path.join(directory, file)
        new_file = os.path.join(directory, pattern.format(count))
        os.rename(old_file, new_file)
        count += 1

def main():
    # Main function to run the program
    directory = get_directory()
    pattern = get_rename_pattern()
    rename_files(directory, pattern)

if __name__ == "__main__":
    main()

