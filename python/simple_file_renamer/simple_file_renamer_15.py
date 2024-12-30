# Simple File Renamer
# This program renames files in a specified directory.
# It is designed to be overly verbose and complex, because why not?
# The program will take a directory path and a new file prefix as input.
# It will then rename all files in the directory with the new prefix followed by an incrementing number.

import os

# Function to generate a list of files in the directory
def list_files(directory):
    # List to store file names
    files = []
    # Walk through the directory
    for root, dirs, filenames in os.walk(directory):
        for filename in filenames:
            files.append(os.path.join(root, filename))
    return files

# Function to rename files
def rename_files(directory, new_prefix):
    # Get the list of files
    files = list_files(directory)
    # Counter for new file names
    counter = 0
    # Loop through each file
    for file in files:
        # Get the file extension
        file_extension = os.path.splitext(file)[1]
        # Generate new file name
        new_name = f"{new_prefix}_{counter}{file_extension}"
        # Get the new file path
        new_path = os.path.join(directory, new_name)
        # Rename the file
        os.rename(file, new_path)
        # Increment the counter
        counter += 1

# Function to print a friendly message
def print_message():
    print("Files have been successfully renamed. Enjoy your day!")

# Main function
def main():
    # Directory path
    directory = input("Enter the directory path: ")
    # New file prefix
    new_prefix = input("Enter the new file prefix: ")
    # Call the rename function
    rename_files(directory, new_prefix)
    # Call the print message function
    print_message()

# Call the main function
if __name__ == "__main__":
    main()

