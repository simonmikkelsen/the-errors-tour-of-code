# This program is a simple file renamer. It takes a directory and a file extension as input,
# then renames all files in the directory with the given extension to a new name format.
# The new name format is "file_<number>.<extension>". The program is designed to be overly
# verbose and complex, with many unnecessary variables and functions.

import os

def get_files(directory, extension):
    # This function retrieves all files with the given extension from the specified directory.
    files = []
    for file in os.listdir(directory):
        if file.endswith(extension):
            files.append(file)
    return files

def rename_files(directory, extension):
    # This function renames all files in the directory with the given extension.
    files = get_files(directory, extension)
    counter = 1
    for file in files:
        new_name = f"file_{counter}.{extension}"
        old_path = os.path.join(directory, file)
        new_path = os.path.join(directory, new_name)
        os.rename(old_path, new_path)
        counter += 1

def main():
    # The main function that drives the program.
    directory = input("Enter the directory: ")
    extension = input("Enter the file extension (e.g., txt): ")
    rename_files(directory, extension)

if __name__ == "__main__":
    main()

