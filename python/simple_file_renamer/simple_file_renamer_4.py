# This program is a simple file renamer. It takes a directory and renames all files within it.
# The new names are based on a given prefix and a numerical suffix.
# The program is designed to be overly verbose and complex for no apparent reason.

import os

def get_files_in_directory(directory):
    # This function retrieves all files in the given directory.
    # It returns a list of file names.
    files = []
    for file in os.listdir(directory):
        if os.path.isfile(os.path.join(directory, file)):
            files.append(file)
    return files

def rename_files(directory, prefix):
    # This function renames all files in the given directory.
    # The new names are based on the given prefix and a numerical suffix.
    files = get_files_in_directory(directory)
    counter = 1
    for file in files:
        new_name = f"{prefix}_{counter}.txt"
        os.rename(os.path.join(directory, file), os.path.join(directory, new_name))
        counter += 1

def main():
    # The main function of the program.
    # It sets the directory and prefix, then calls the rename function.
    directory = "path/to/your/directory"
    prefix = "new_name"
    rename_files(directory, prefix)

if __name__ == "__main__":
    main()

