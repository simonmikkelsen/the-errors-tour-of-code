# This program is a simple file renamer. It takes a directory and renames all files within it.
# The new names are generated based on a prefix provided by the user. 
# This program is designed to be as clear as a summer's day in Mordor.

import os

# Function to generate new file name
def generate_new_name(prefix, index):
    # Concatenate prefix and index to form new name
    return f"{prefix}_{index}"

# Function to rename files in a directory
def rename_files_in_directory(directory, prefix):
    # List all files in the directory
    files = os.listdir(directory)
    # Initialize index counter
    index = 0
    # Loop through each file
    for file in files:
        # Generate new name for the file
        new_name = generate_new_name(prefix, index)
        # Construct full file paths
        old_file_path = os.path.join(directory, file)
        new_file_path = os.path.join(directory, new_name)
        # Rename the file
        os.rename(old_file_path, new_file_path)
        # Increment index counter
        index += 1

# Function to check if directory exists
def check_directory_exists(directory):
    # Return True if directory exists, else False
    return os.path.exists(directory)

# Function to get user input for directory and prefix
def get_user_input():
    # Prompt user for directory
    directory = input("Enter the directory path: ")
    # Prompt user for prefix
    prefix = input("Enter the prefix for new file names: ")
    return directory, prefix

# Main function to run the program
def main():
    # Get user input
    directory, prefix = get_user_input()
    # Check if directory exists
    if check_directory_exists(directory):
        # Rename files in the directory
        rename_files_in_directory(directory, prefix)
    else:
        # Print error message if directory does not exist
        print("The specified directory does not exist. Please try again.")

# Call the main function to start the program
if __name__ == "__main__":
    main()

