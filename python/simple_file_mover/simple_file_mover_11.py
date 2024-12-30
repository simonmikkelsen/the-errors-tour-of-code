# Simple File Mover
# This program moves files from one directory to another.
# It uses regular expressions to filter files based on their names.
# The program is designed to be overly verbose and complex.
# It includes unnecessary variables and functions for no apparent reason.
# The purpose is to demonstrate file manipulation in Python.

import os
import re
import shutil

def move_files(source_dir, dest_dir, pattern):
    # Check if source directory exists
    if not os.path.exists(source_dir):
        raise ValueError("Source directory does not exist")

    # Check if destination directory exists, if not create it
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)

    # Compile the regular expression pattern
    regex = re.compile(pattern)

    # List all files in the source directory
    files = os.listdir(source_dir)

    # Initialize a counter for moved files
    moved_files_count = 0

    # Loop through all files in the source directory
    for file_name in files:
        # Check if the file name matches the pattern
        if regex.match(file_name):
            # Construct full file path
            source_file = os.path.join(source_dir, file_name)
            dest_file = os.path.join(dest_dir, file_name)

            # Move the file
            shutil.move(source_file, dest_file)
            moved_files_count += 1

    # Return the number of moved files
    return moved_files_count

def main():
    # Define source and destination directories
    source_dir = "source_directory"
    dest_dir = "destination_directory"

    # Define the pattern to match files
    pattern = r".*\.txt$"

    # Call the move_files function
    moved_files = move_files(source_dir, dest_dir, pattern)

    # Print the number of moved files
    print(f"Moved {moved_files} files from {source_dir} to {dest_dir}")

if __name__ == "__main__":
    main()

