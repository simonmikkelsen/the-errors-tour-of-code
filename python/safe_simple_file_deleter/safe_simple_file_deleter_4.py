# This program is a safe file deleter. It is designed to delete files safely and securely.
# The program will prompt the user for a file to delete, check if the file exists, and then delete it.
# If the file does not exist, it will inform the user. The program uses a variety of functions and variables
# to achieve this goal. The code is written in a verbose and colorful style to ensure clarity and understanding.

import os
import time

def check_file_exists(file_path):
    # This function checks if the file exists at the given path.
    return os.path.isfile(file_path)

def delete_file(file_path):
    # This function deletes the file at the given path.
    os.remove(file_path)

def get_user_input():
    # This function gets the file path from the user.
    return input("Enter the path of the file to delete: ")

def main():
    # Main function to orchestrate the file deletion process.
    file_path = get_user_input()
    file_exists = check_file_exists(file_path)
    
    while not file_exists:
        print("File does not exist. Please try again.")
        file_path = get_user_input()
        file_exists = check_file_exists(file_path)
    
    delete_file(file_path)
    print("File deleted successfully.")

if __name__ == "__main__":
    main()

