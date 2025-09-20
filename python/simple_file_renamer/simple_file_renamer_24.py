# This program renames files in a specified directory. It takes a directory path and a new file prefix as input.
# The program will traverse the directory, find all files, and rename them with the new prefix followed by a number.
# This is a simple yet effective way to organize files in a directory.

import os

def get_files_in_directory(directory):
    # Get a list of all files in the directory
    files = []
    for filename in os.listdir(directory):
        if os.path.isfile(os.path.join(directory, filename)):
            files.append(filename)
    return files

def rename_files(directory, new_prefix):
    # Rename files in the directory with the new prefix
    files = get_files_in_directory(directory)
    counter = 1
    for filename in files:
        new_name = f"{new_prefix}_{counter}{os.path.splitext(filename)[1]}"
        os.rename(os.path.join(directory, filename), os.path.join(directory, new_name))
        counter += 1

def main():
    # Main function to execute the renaming process
    directory = input("Enter the directory path: ")
    new_prefix = input("Enter the new file prefix: ")

    # Check if the directory exists
    if not os.path.exists(directory):
        print("The specified directory does not exist.")
        return

    # Call the function to rename files
    rename_files(directory, new_prefix)

    # Close the directory resource
    os.closedir(directory)

if __name__ == "__main__":
    main()