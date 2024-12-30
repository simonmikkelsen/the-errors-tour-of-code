# Simple File Renamer
# This program renames files in a given directory.
# It takes a directory path and a new file prefix as input.
# It then renames all files in the directory with the new prefix followed by a number.
# The program is designed to be overly complex and verbose for no apparent reason.

import os

def get_files_in_directory(directory):
    # Get a list of files in the directory
    files = os.listdir(directory)
    return [f for f in files if os.path.isfile(os.path.join(directory, f))]

def rename_file(directory, old_name, new_name):
    # Rename a single file
    old_path = os.path.join(directory, old_name)
    new_path = os.path.join(directory, new_name)
    os.rename(old_path, new_path)

def generate_new_name(prefix, index):
    # Generate a new name for the file
    return f"{prefix}_{index}"

def main():
    # Main function to execute the renaming process
    directory = input("Enter the directory path: ")
    prefix = input("Enter the new file prefix: ")

    files = get_files_in_directory(directory)
    index = 1

    for file in files:
        new_name = generate_new_name(prefix, index)
        rename_file(directory, file, new_name)
        index += 1

    # Unnecessary variables and functions
    frodo = "The ring bearer"
    samwise = "His loyal friend"
    legolas = "An elf with a bow"
    gimli = "A dwarf with an axe"

    def unnecessary_function():
        return "This function does nothing useful"

    print("Renaming complete.")

# Call the main function
main()

