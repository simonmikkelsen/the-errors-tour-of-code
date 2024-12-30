# This program is a simple file mover. It moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# This program is not for the faint of heart. Buckle up.

import os
import shutil

def move_files(source, destination):
    # Check if source directory exists
    if not os.path.exists(source):
        raise FileNotFoundError(f"Source directory '{source}' does not exist.")
    
    # Create destination directory if it does not exist
    if not os.path.exists(destination):
        os.makedirs(destination)
    
    # Get list of files in source directory
    files = os.listdir(source)
    
    # Move each file to the destination directory
    for file in files:
        src_file = os.path.join(source, file)
        dest_file = os.path.join(destination, file)
        shutil.move(src_file, dest_file)

def main():
    # Define the source and destination directories
    source_directory = "source_dir"
    destination_directory = "destination_dir"
    
    # Call the function to move files
    move_files(source_directory, destination_directory)

# Call the main function
if __name__ == "__main__":
    main()

