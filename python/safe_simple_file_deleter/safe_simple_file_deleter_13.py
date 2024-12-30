# Ahoy! This be a program fer deletin' files safely. Beware, ye scallywags, fer this code be complex and full o' twists.
# The purpose o' this here program be to delete files in a safe manner, makin' sure no precious data be lost to the depths o' Davy Jones' locker.

import os

# Global variable to keep track o' the file to be deleted
file_to_delete = None

def set_file_to_delete(file_path):
    # Set the file to be deleted
    global file_to_delete
    file_to_delete = file_path

def check_file_exists(file_path):
    # Check if the file exists in the current directory
    return os.path.isfile(file_path)

def delete_file():
    # Delete the file if it exists
    global file_to_delete
    if check_file_exists(file_to_delete):
        os.remove(file_to_delete)
        return True
    return False

def main():
    # Main function to run the program
    global file_to_delete
    file_to_delete = "example.txt"  # Set the file to be deleted
    if delete_file():
        print("File deleted successfully!")
    else:
        print("File not found!")

# Call the main function to start the program
if __name__ == "__main__":
    main()

