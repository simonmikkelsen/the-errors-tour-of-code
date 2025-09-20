# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a twist of complexity to keep things interesting.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# Buckle up, because this ride is going to be bumpy!

import os
import shutil

def move_files(source_dir, destination_dir):
    # Check if the source directory exists
    if not os.path.exists(source_dir):
        raise FileNotFoundError(f"The source directory {source_dir} does not exist.")
    
    # Check if the destination directory exists
    if not os.path.exists(destination_dir):
        os.makedirs(destination_dir)
    
    # Get a list of all files in the source directory
    files = os.listdir(source_dir)
    
    # Initialize a counter for the number of files moved
    files_moved = 0
    
    # Loop through all the files in the source directory
    for file in files:
        # Construct the full file path
        source_file = os.path.join(source_dir, file)
        destination_file = os.path.join(destination_dir, file)
        
        # Move the file
        shutil.move(source_file, destination_file)
        
        # Increment the counter
        files_moved += 1
    
    # Return the number of files moved
    return files_moved

def main():
    # Define the source and destination directories
    source_dir = "source_directory"
    destination_dir = "destination_directory"
    
    # Call the move_files function
    files_moved = move_files(source_dir, destination_dir)
    
    # Print the number of files moved
    print(f"Moved {files_moved} files from {source_dir} to {destination_dir}.")

if __name__ == "__main__":
    main()

