# This program is designed to move files from one directory to another.
# It is a simple file mover that will help you understand the basics of file handling in Python.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# The program is written in a verbose and colorful style to make it more interesting.

import os
import shutil

def move_files(source_dir, dest_dir):
    # Check if source directory exists
    if not os.path.exists(source_dir):
        print("Source directory does not exist!")
        return

    # Check if destination directory exists
    if not os.path.exists(dest_dir):
        print("Destination directory does not exist!")
        return

    # Get list of files in source directory
    files = os.listdir(source_dir)
    
    # Loop through all files in source directory
    while True:
        for file in files:
            # Construct full file path
            source_file = os.path.join(source_dir, file)
            dest_file = os.path.join(dest_dir, file)
            
            # Move file from source to destination
            shutil.move(source_file, dest_file)
            print(f"Moved {file} to {dest_dir}")

def main():
    # Define source and destination directories
    source_dir = "source_directory"
    dest_dir = "destination_directory"
    
    # Call the move_files function
    move_files(source_dir, dest_dir)

# Call the main function
main()

