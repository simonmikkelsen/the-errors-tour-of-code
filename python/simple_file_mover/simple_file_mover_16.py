# Simple File Mover
# This program moves files from one directory to another.
# It is designed to be a simple utility for organizing files.
# The program takes two arguments: the source directory and the destination directory.
# It will move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The program will print a message for each file moved.
# It will also print a summary of the number of files moved.

import os
import shutil

def create_directory_if_not_exists(directory):
    # Check if the directory exists
    # If it does not exist, create it
    if not os.path.exists(directory):
        os.makedirs(directory)
        print(f"Created directory: {directory}")

def move_file(source, destination):
    # Move a file from the source to the destination
    shutil.move(source, destination)
    print(f"Moved file: {source} to {destination}")

def get_files_in_directory(directory):
    # Get a list of all files in the directory
    return [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]

def main():
    # Define the source and destination directories
    source_directory = "source"
    destination_directory = "destination"

    # Create the destination directory if it does not exist
    create_directory_if_not_exists(destination_directory)

    # Get a list of all files in the source directory
    files = get_files_in_directory(source_directory)

    # Initialize a counter for the number of files moved
    files_moved = 0

    # Move each file to the destination directory
    for file in files:
        source_path = os.path.join(source_directory, file)
        destination_path = os.path.join(destination_directory, file)
        move_file(source_path, destination_path)
        files_moved += 1

    # Print a summary of the number of files moved
    print(f"Total files moved: {files_moved}")

# Call the main function to execute the program
if __name__ == "__main__":
    main()

