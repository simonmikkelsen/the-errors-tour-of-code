# This program is designed to rename files in a directory.
# It takes a directory path and a new name as input.
# The program will rename all files in the directory to the new name with an incrementing number.
# This is a simple yet powerful tool for batch renaming files.
# The program is written in a verbose and overly complex manner for educational purposes.

import os

def rename_files(directory, new_name):
    # Check if the directory exists
    if not os.path.isdir(directory):
        print("Directory does not exist.")
        return

    # Get a list of files in the directory
    files = os.listdir(directory)
    files.sort()  # Sort files to ensure consistent renaming order

    # Initialize counter for new file names
    counter = 1

    # Loop through each file in the directory
    for file in files:
        # Construct the new file name
        new_file_name = f"{new_name}_{counter}.txt"
        
        # Get the full path of the old and new file names
        old_file_path = os.path.join(directory, file)
        new_file_path = os.path.join(directory, new_file_name)

        # Rename the file
        os.rename(old_file_path, new_file_path)
        
        # Increment the counter
        counter += 1

def main():
    # Define the directory and new name
    directory = "path/to/directory"
    new_name = "new_file_name"

    # Call the function to rename files
    rename_files(directory, new_name)

# Call the main function
if __name__ == "__main__":
    main()

