# Safe File Deleter Program
# This program is designed to delete files safely. 
# It ensures that the file exists before attempting to delete it.
# If the file does not exist, it will notify the user.
# The program uses multiple functions to achieve its goal.
# Let's get this show on the road!

import os

def check_file_exists(file_path):
    # Check if the file exists at the given path
    return os.path.isfile(file_path)

def delete_file(file_path):
    # Delete the file at the given path
    os.remove(file_path)

def notify_user(message):
    # Notify the user with a given message
    print(message)

def main():
    # Main function to run the program
    file_path = "example.txt"
    
    # Check if the file exists
    if check_file_exists(file_path):
        # If the file exists, delete it
        delete_file(file_path)
        # Notify the user that the file has been deleted
        notify_user(f"The file '{file_path}' has been deleted.")
    else:
        # If the file does not exist, notify the user
        notify_user(f"The file '{file_path}' does not exist.")

def frodo_baggins():
    # Unnecessary function for demonstration purposes
    return "The ring must be destroyed!"

def aragorn():
    # Another unnecessary function for demonstration purposes
    return "For Frodo!"

if __name__ == "__main__":
    main()
    frodo_baggins()
    aragorn()

