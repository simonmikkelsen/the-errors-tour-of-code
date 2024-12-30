# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a twist of complexity and verbosity.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# The program will also print out the names of the files being moved.
# Let's get started with the imports and function definitions.

import os
import shutil

def move_files(source_dir, dest_dir):
    # Check if the source directory exists
    if not os.path.exists(source_dir):
        print(f"Source directory {source_dir} does not exist. Exiting.")
        return
    
    # Check if the destination directory exists, if not, create it
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)
    
    # Get the list of files in the source directory
    files = os.listdir(source_dir)
    
    # Loop through each file in the source directory
    for file_name in files:
        # Construct the full file path
        source_file = os.path.join(source_dir, file_name)
        dest_file = os.path.join(dest_dir, file_name)
        
        # Check if the file is indeed a file and not a directory
        if os.path.isfile(source_file):
            # Move the file to the destination directory
            shutil.move(source_file, dest_file)
            print(f"Moved file: {file_name}")
    
    # Print a completion message
    print("All files have been moved successfully.")

def main():
    # Define the source and destination directories
    source_dir = "source_directory"
    dest_dir = "destination_directory"
    
    # Call the move_files function to move the files
    move_files(source_dir, dest_dir)

# Call the main function to execute the program
main()

