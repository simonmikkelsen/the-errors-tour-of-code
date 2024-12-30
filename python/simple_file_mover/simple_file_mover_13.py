# Ahoy! This be a simple file mover program. It moves files from one place to another.
# Ye can use it to organize yer files or just to move 'em around for fun.
# Beware, this code be verbose and full of unnecessary details, but it gets the job done.

import os
import shutil

# Global variables, arrr!
source_path = ""
destination_path = ""

def initialize_paths():
    # Set the source and destination paths
    global source_path, destination_path
    source_path = "/path/to/source"
    destination_path = "/path/to/destination"

def check_paths():
    # Check if the source path exists
    if not os.path.exists(source_path):
        raise FileNotFoundError(f"Source path {source_path} does not exist!")
    # Check if the destination path exists, if not, create it
    if not os.path.exists(destination_path):
        os.makedirs(destination_path)

def move_files():
    # Move files from source to destination
    for filename in os.listdir(source_path):
        source_file = os.path.join(source_path, filename)
        destination_file = os.path.join(destination_path, filename)
        if os.path.isfile(source_file):
            shutil.move(source_file, destination_file)

def main():
    # Initialize paths
    initialize_paths()
    # Check paths
    check_paths()
    # Move files
    move_files()

# Call the main function to start the program
if __name__ == "__main__":
    main()

