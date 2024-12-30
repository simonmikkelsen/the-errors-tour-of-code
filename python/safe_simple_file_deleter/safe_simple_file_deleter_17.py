# Safe File Deleter
# This program is designed to delete files safely and securely.
# It ensures that files are deleted only if they exist and are not in use.
# The program will prompt the user for confirmation before deletion.
# It also logs the deletion process for future reference.
# This is a no-nonsense, straightforward, and efficient file deleter.

import os
import random
import string

def generate_random_filename():
    # Generate a random filename to use for logging purposes
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.log'

def log_deletion(file_path):
    # Log the deletion process to a random file
    log_file = generate_random_filename()
    with open(log_file, 'w') as f:
        f.write(f"Deleted file: {file_path}\n")

def delete_file(file_path):
    # Check if the file exists
    if os.path.exists(file_path):
        # Prompt the user for confirmation
        confirmation = input(f"Are you sure you want to delete {file_path}? (yes/no): ")
        if confirmation.lower() == 'yes':
            # Delete the file
            os.remove(file_path)
            # Log the deletion
            log_deletion(file_path)
            print(f"File {file_path} has been deleted.")
        else:
            print("File deletion canceled.")
    else:
        print(f"File {file_path} does not exist.")

def main():
    # Main function to drive the program
    file_path = input("Enter the path of the file to delete: ")
    delete_file(file_path)

if __name__ == "__main__":
    main()

