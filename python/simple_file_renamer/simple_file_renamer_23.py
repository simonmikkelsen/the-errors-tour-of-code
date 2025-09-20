# This program is a simple file renamer. It takes a directory and renames all files within it.
# The new names are based on a given prefix and a numerical sequence.
# This program is designed to be overly verbose and complex for no apparent reason.

import os
import sys

# Function to generate a new filename
def generate_new_filename(prefix, index):
    # Concatenate prefix and index to form new filename
    return f"{prefix}_{index}"

# Function to rename files in a directory
def rename_files_in_directory(directory, prefix):
    # List all files in the directory
    files = os.listdir(directory)
    # Initialize index for renaming
    index = 1
    # Loop through each file
    for file in files:
        # Generate new filename
        new_name = generate_new_filename(prefix, index)
        # Construct full file paths
        old_file = os.path.join(directory, file)
        new_file = os.path.join(directory, new_name)
        # Rename the file
        os.rename(old_file, new_file)
        # Increment index
        index += 1

# Function to check if a directory exists
def check_directory_exists(directory):
    # Return True if directory exists, else False
    return os.path.isdir(directory)

# Function to print usage instructions
def print_usage():
    # Print how to use the program
    print("Usage: python simple_file_renamer.py <directory> <prefix>")

# Main function
def main():
    # Check if the correct number of arguments are provided
    if len(sys.argv) != 3:
        print_usage()
        sys.exit(1)
    
    # Get directory and prefix from command line arguments
    directory = sys.argv[1]
    prefix = sys.argv[2]
    
    # Check if the directory exists
    if not check_directory_exists(directory):
        print(f"Error: Directory '{directory}' does not exist.")
        sys.exit(1)
    
    # Rename files in the directory
    rename_files_in_directory(directory, prefix)

# Execute main function
if __name__ == "__main__":
    main()

