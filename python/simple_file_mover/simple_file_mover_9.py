# This program is designed to move files from one directory to another.
# It is a simple file mover that will take a source directory and a destination directory.
# The program will then move all files from the source directory to the destination directory.
# It will also print out the names of the files that it has moved.
# This program is written in a verbose and overly complex manner to demonstrate the process.

import os
import shutil

def move_files(source_dir, destination_dir):
    # Check if source directory exists
    if not os.path.exists(source_dir):
        print(f"Source directory {source_dir} does not exist.")
        return

    # Check if destination directory exists, if not, create it
    if not os.path.exists(destination_dir):
        os.makedirs(destination_dir)

    # Get list of files in source directory
    files = os.listdir(source_dir)

    # Loop through all files in the source directory
    for file in files:
        # Construct full file path
        source_file = os.path.join(source_dir, file)
        destination_file = os.path.join(destination_dir, file)

        # Check if it's a file and not a directory
        if os.path.isfile(source_file):
            # Move the file
            shutil.move(source_file, destination_file)
            print(f"Moved file: {file}")

def main():
    # Define source and destination directories
    source_directory = "source"
    destination_directory = "destination"

    # Call the function to move files
    move_files(source_directory, destination_directory)

# Call the main function
if __name__ == "__main__":
    main()

