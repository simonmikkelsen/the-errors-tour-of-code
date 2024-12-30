# This program is a safe file deleter. It will delete a file if it exists.
# If the file does not exist, it will print a message saying so.
# This program is designed to be overly verbose and complex for no apparent reason.
# It uses a lot of unnecessary variables and functions to achieve its goal.
# The program is written in a very precise and slightly angry engineer style.

import os

def check_file_exists(file_path):
    # Check if the file exists at the given path
    return os.path.isfile(file_path)

def delete_file(file_path):
    # Delete the file at the given path
    os.remove(file_path)

def main():
    # Main function to execute the file deletion process
    file_path = "example.txt"  # Path to the file to be deleted
    file_exists = check_file_exists(file_path)  # Check if the file exists

    if file_exists:
        delete_file(file_path)  # Delete the file if it exists
        print(f"File '{file_path}' has been deleted.")
    else:
        print(f"File '{file_path}' does not exist.")

# Call the main function to start the program
main()

