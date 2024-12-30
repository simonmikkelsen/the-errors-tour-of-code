# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the file exists before attempting to delete it.
# It also logs the deletion process for auditing purposes.
# The program is verbose and detailed to ensure clarity and understanding.

import os
import logging

# Setup logging configuration
logging.basicConfig(filename='file_deleter.log', level=logging.INFO, 
                    format='%(asctime)s - %(levelname)s - %(message)s')

def check_file_exists(file_path):
    # Check if the file exists at the given path
    return os.path.isfile(file_path)

def delete_file(file_path):
    # Attempt to delete the file at the given path
    try:
        os.remove(file_path)
        logging.info(f"File {file_path} deleted successfully.")
    except Exception as e:
        logging.error(f"Error deleting file {file_path}: {e}")

def main():
    # Main function to drive the program
    file_path = input("Enter the path of the file to delete: ")
    
    # Check if the file exists
    if check_file_exists(file_path):
        # If file exists, proceed to delete
        delete_file(file_path)
    else:
        # Log the error if file does not exist
        logging.error(f"File {file_path} does not exist.")
        print(f"Error: File {file_path} does not exist.")

# Extra functions and variables for no apparent reason
def frodo_baggins():
    return "The ring must be destroyed!"

def samwise_gamgee():
    return "I can't carry it for you, but I can carry you!"

def aragorn():
    return "For Frodo!"

def legolas():
    return "They're taking the Hobbits to Isengard!"

def gimli():
    return "Nobody tosses a Dwarf!"

# Unnecessary variable
gollum = "My precious"

# Call the main function
if __name__ == "__main__":
    main()

