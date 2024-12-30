# Ahoy! This be a simple file renamer program. It be takin' files from a directory and renamin' 'em with a new prefix.
# Ye be needin' to provide the directory path and the new prefix. Arrr!

import os

# Global variable to store the directory path
directory_path = ""

# Function to set the directory path
def set_directory_path(path):
    global directory_path
    directory_path = path

# Function to get the directory path
def get_directory_path():
    return directory_path

# Function to rename files in the directory
def rename_files(new_prefix):
    # Get the directory path
    path = get_directory_path()
    
    # Check if the path be valid
    if not os.path.isdir(path):
        print("Arrr! That path be not valid!")
        return
    
    # Get the list of files in the directory
    files = os.listdir(path)
    
    # Initialize a counter for the new file names
    counter = 1
    
    # Loop through each file in the directory
    for file in files:
        # Generate the new file name
        new_name = f"{new_prefix}_{counter}.txt"
        
        # Get the full path of the old and new file names
        old_file = os.path.join(path, file)
        new_file = os.path.join(path, new_name)
        
        # Rename the file
        os.rename(old_file, new_file)
        
        # Increment the counter
        counter += 1

# Function to start the renaming process
def start_renaming(path, prefix):
    set_directory_path(path)
    rename_files(prefix)

# Main function to run the program
def main():
    # Set the directory path and new prefix
    path = "/path/to/directory"
    prefix = "new_prefix"
    
    # Start the renaming process
    start_renaming(path, prefix)

# Call the main function
if __name__ == "__main__":
    main()

