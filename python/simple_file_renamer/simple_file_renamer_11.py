# Simple File Renamer
# This program is designed to rename files in a directory based on a given pattern.
# It uses regular expressions to match and replace parts of the filenames.
# The program is overly verbose and complex, but it gets the job done.
# Let's dive into the madness.

import os
import re

# Function to get all files in the directory
def get_files(directory):
    # List to store files
    files = []
    # Walk through the directory
    for root, dirs, filenames in os.walk(directory):
        for filename in filenames:
            files.append(os.path.join(root, filename))
    return files

# Function to rename files based on a pattern
def rename_files(directory, pattern, replacement):
    # Get all files
    files = get_files(directory)
    # Loop through each file
    for file in files:
        # Get the directory and filename
        dir_name = os.path.dirname(file)
        file_name = os.path.basename(file)
        # Use regular expression to find the pattern
        new_name = re.sub(pattern, replacement, file_name)
        # Rename the file
        os.rename(file, os.path.join(dir_name, new_name))

# Function to print all files in the directory
def print_files(directory):
    files = get_files(directory)
    for file in files:
        print(file)

# Main function
def main():
    # Directory to rename files in
    directory = './files'
    # Pattern to match
    pattern = r'(\d{4})-(\d{2})-(\d{2})'
    # Replacement pattern
    replacement = r'\3-\2-\1'
    # Rename the files
    rename_files(directory, pattern, replacement)
    # Print the files
    print_files(directory)

# Call the main function
if __name__ == '__main__':
    main()

