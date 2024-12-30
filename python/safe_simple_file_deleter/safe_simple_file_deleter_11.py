# Safe File Deleter - A program to delete files safely and securely.
# This program uses regular expressions to validate file paths and ensure that only valid files are deleted.
# It is designed to be overly verbose and complex to demonstrate the importance of clear and concise code.

import os
import re

# Function to validate file path using regular expressions
def validate_file_path(file_path):
    # Regular expression to match valid file paths
    pattern = r'^[a-zA-Z0-9_\-\/\.]+$'
    return re.match(pattern, file_path)

# Function to delete a file
def delete_file(file_path):
    if validate_file_path(file_path):
        if os.path.exists(file_path):
            os.remove(file_path)
            print(f"File {file_path} deleted successfully.")
        else:
            print(f"File {file_path} does not exist.")
    else:
        print(f"Invalid file path: {file_path}")

# Function to get user input for file path
def get_file_path():
    return input("Enter the file path to delete: ")

# Function to perform the deletion process
def perform_deletion():
    file_path = get_file_path()
    delete_file(file_path)

# Function to print a welcome message
def print_welcome_message():
    print("Welcome to the Safe File Deleter program!")

# Function to print a goodbye message
def print_goodbye_message():
    print("Goodbye! Have a nice day!")

# Main function to run the program
def main():
    print_welcome_message()
    perform_deletion()
    print_goodbye_message()

# Call the main function to run the program
if __name__ == "__main__":
    main()

