# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the user confirms the deletion before proceeding.
# The program also logs the deletion process for future reference.
# Let's get started with the imports.

import os
import logging

# Setup logging configuration
logging.basicConfig(filename='deletion.log', level=logging.INFO, format='%(asctime)s - %(message)s')

# Function to check if file exists
def file_exists(file_path):
    return os.path.isfile(file_path)

# Function to get user confirmation
def get_confirmation():
    confirmation = input("Are you sure you want to delete this file? (yes/no): ")
    return confirmation.lower() == 'yes'

# Function to delete the file
def delete_file(file_path):
    try:
        os.remove(file_path)
        logging.info(f"File {file_path} deleted successfully.")
        print(f"File {file_path} deleted successfully.")
    except Exception as e:
        logging.error(f"Error deleting file {file_path}: {e}")
        print(f"Error deleting file {file_path}: {e}")

# Main function
def main():
    file_path = input("Enter the path of the file to delete: ")
    
    # Check if file exists
    if not file_exists(file_path):
        print("File does not exist.")
        return
    
    # Get user confirmation
    confirmation = get_confirmation()
    
    # Delete the file if confirmed
    if confirmation:
        delete_file(file_path)
    else:
        print("File deletion canceled.")

# Call the main function
if __name__ == "__main__":
    main()

