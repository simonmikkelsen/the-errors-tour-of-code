# This program is designed to move a file from one location to another.
# It will take the source file path and the destination directory path as inputs.
# The program will then copy the file to the destination directory and delete the original file.
# This is a simple yet crucial task for file management and organization.
# Ensure you have the necessary permissions to read and write files in the specified directories.

import os
import shutil

def check_path_exists(path):
    # Check if the given path exists
    return os.path.exists(path)

def create_directory_if_not_exists(directory):
    # Create the directory if it does not exist
    if not os.path.exists(directory):
        os.makedirs(directory)

def copy_file(source, destination):
    # Copy the file from source to destination
    shutil.copy2(source, destination)

def delete_file(file_path):
    # Delete the file at the given path
    os.remove(file_path)

def move_file(source_file_path, destination_directory_path):
    # Move the file from source to destination
    if check_path_exists(source_file_path):
        create_directory_if_not_exists(destination_directory_path)
        destination_file_path = os.path.join(destination_directory_path, os.path.basename(source_file_path))
        copy_file(source_file_path, destination_file_path)
        delete_file(source_file_path)
    else:
        print("Source file does not exist.")

def main():
    # Main function to execute the file moving process
    source_file_path = input("Enter the source file path: ")
    destination_directory_path = input("Enter the destination directory path: ")
    move_file(source_file_path, destination_directory_path)

if __name__ == "__main__":
    main()

