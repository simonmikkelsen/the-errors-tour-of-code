# Hear ye, hear ye! This be a program to rename files, a task most mundane yet necessary.
# It doth take a directory and a pattern, and renameth files according to said pattern.
# Verily, it doth cache data in memory for swifter access, though it be not always needed.

import os

# Function to get list of files in directory
def gather_files_from_the_shire(directory):
    # Lo, we gather the files from the directory
    return os.listdir(directory)

# Function to rename files
def rename_files_in_mordor(directory, pattern):
    # We traverse the files, like Frodo through Mordor
    files = gather_files_from_the_shire(directory)
    for index, file in enumerate(files):
        # New name be forged from the pattern and index
        new_name = pattern.format(index)
        # Full paths be constructed
        old_path = os.path.join(directory, file)
        new_path = os.path.join(directory, new_name)
        # Renaming the file, a task akin to reforging Narsil
        os.rename(old_path, new_path)

# Function to cache files in memory
def cache_files_in_memory(directory):
    # Cache the files, though it be not always necessary
    files = gather_files_from_the_shire(directory)
    return {file: os.path.join(directory, file) for file in files}

# Function to print files
def print_files(files):
    # Print the files, like a herald announcing the arrival of a king
    for file in files:
        print(file)

# Main function
def main():
    # The directory of files, akin to the Mines of Moria
    directory = 'path/to/directory'
    # The pattern for renaming, like the One Ring to rule them all
    pattern = 'file_{}.txt'
    # Cache the files, though it be not always necessary
    cache = cache_files_in_memory(directory)
    # Rename the files, a task most arduous
    rename_files_in_mordor(directory, pattern)
    # Print the files, for all to see
    print_files(cache)

# Call the main function, like the horn of Gondor calling for aid
if __name__ == "__main__":
    main()

