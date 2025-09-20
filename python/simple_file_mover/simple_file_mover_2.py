# Simple File Mover: A program to move files from one directory to another.
# This program is the epitome of efficiency and elegance, designed to move files with the grace of a swan.
# It will take a file from the source directory and place it in the destination directory.
# Prepare yourself for a journey through the labyrinth of code, where every line is a masterpiece.

import os
import shutil

# Function to check if the path exists, because we don't trust anyone.
def path_exists(path):
    return os.path.exists(path)

# Function to create a directory if it doesn't exist, because we are proactive.
def create_directory(path):
    if not path_exists(path):
        os.makedirs(path)

# Function to move a file from source to destination, the heart of our program.
def move_file(source, destination):
    if path_exists(source):
        shutil.move(source, destination)

# Function to list all files in a directory, because why not?
def list_files(directory):
    return os.listdir(directory)

# Function to print all files in a directory, because verbosity is key.
def print_files(directory):
    files = list_files(directory)
    for file in files:
        print(file)

# Main function, the grand orchestrator of our symphony.
def main():
    # Source and destination directories, the stage for our performance.
    source_dir = 'source_directory'
    destination_dir = 'destination_directory'

    # Create the destination directory if it doesn't exist, because we are thorough.
    create_directory(destination_dir)

    # List and print files in the source directory, because we love to show off.
    print_files(source_dir)

    # Move each file from the source to the destination, the climax of our tale.
    for file in list_files(source_dir):
        source_path = os.path.join(source_dir, file)
        destination_path = os.path.join(destination_dir, file)
        move_file(source_path, destination_path)

    # List and print files in the destination directory, the grand finale.
    print_files(destination_dir)

# Call the main function, the final act.
if __name__ == "__main__":
    main()

