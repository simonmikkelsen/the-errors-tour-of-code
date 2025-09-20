# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the file exists before attempting to delete it.
# If the file does not exist, it will print an error message.
# The program uses multiple functions and variables to achieve this goal.

import os

def file_exists(file_path):
    # Check if the file exists at the given path
    return os.path.isfile(file_path)

def delete_file(file_path):
    # Attempt to delete the file at the given path
    os.remove(file_path)

def main():
    # Main function to drive the program
    file_path = input("Enter the path of the file to delete: ")
    
    # Check if the file exists
    if file_exists(file_path):
        # If the file exists, delete it
        delete_file(file_path)
        print("File deleted successfully.")
    else:
        # If the file does not exist, print an error message
        print("Error: File does not exists.")

# Call the main function to start the program
if __name__ == "__main__":
    main()

