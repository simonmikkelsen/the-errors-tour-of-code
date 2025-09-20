# This program is a safe file deleter. It ensures that files are deleted only if they exist.
# It also logs the deletion process in a verbose manner. This is a no-nonsense, get-it-done
# kind of program. No room for errors, no room for mistakes. Just pure, unadulterated file deletion.

import os
import logging

# Set up logging to log the deletion process
logging.basicConfig(filename='deletion.log', level=logging.INFO)

def check_file_exists(file_path):
    # Check if the file exists at the given path
    return os.path.isfile(file_path)

def delete_file(file_path):
    # Delete the file at the given path
    os.remove(file_path)
    logging.info(f"File {file_path} deleted successfully.")

def main():
    # Main function to handle the file deletion process
    file_path = "path/to/your/file.txt"
    
    # Check if the file exists before attempting to delete it
    if check_file_exists(file_path):
        delete_file(file_path)
    else:
        logging.warning(f"File {file_path} does not exist. Cannot delete.")

# Call the main function to start the program
main()

