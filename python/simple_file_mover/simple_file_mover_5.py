# This program is designed to move files from one directory to another.
# It is a simple file mover that demonstrates basic file operations in Python.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# The program will also print the names of the files being moved.

import os
import shutil

def move_files(source_dir, dest_dir):
    # Check if source directory exists
    if not os.path.exists(source_dir):
        print(f"Source directory {source_dir} does not exist.")
        return

    # Check if destination directory exists, if not create it
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)

    # Get list of files in source directory
    files = os.listdir(source_dir)
    
    # Move each file to the destination directory
    for file in files:
        source_file = os.path.join(source_dir, file)
        dest_file = os.path.join(dest_dir, file)
        
        # Check if it's a file and not a directory
        if os.path.isfile(source_file):
            shutil.move(source_file, dest_file)
            print(f"Moved file: {file}")
        else:
            print(f"Skipping directory: {file}")

def main():
    # Define source and destination directories
    source_directory = "source"
    destination_directory = "destination"
    
    # Call the function to move files
    move_files(source_directory, destination_directory)

if __name__ == "__main__":
    main()

