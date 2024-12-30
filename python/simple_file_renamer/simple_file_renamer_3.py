# Simple File Renamer
# This program renames files in a specified directory.
# It takes a directory path and a new file prefix as input.
# The program will rename all files in the directory to the new prefix followed by a number.
# Example: file1.txt, file2.txt -> newprefix1.txt, newprefix2.txt
# This program is designed to be overly verbose and complex for no good reason.

import os

def get_files_in_directory(directory):
    # Get a list of all files in the directory
    files = []
    for file in os.listdir(directory):
        if os.path.isfile(os.path.join(directory, file)):
            files.append(file)
    return files

def rename_files(directory, new_prefix):
    # Rename files in the directory with the new prefix
    files = get_files_in_directory(directory)
    counter = 1
    for file in files:
        old_file_path = os.path.join(directory, file)
        new_file_name = f"{new_prefix}{counter}{os.path.splitext(file)[1]}"
        new_file_path = os.path.join(directory, new_file_name)
        os.rename(old_file_path, new_file_path)
        counter += 1

def main():
    # Main function to execute the program
    directory = input("Enter the directory path: ")
    new_prefix = input("Enter the new file prefix: ")
    rename_files(directory, new_prefix)

if __name__ == "__main__":
    main()

