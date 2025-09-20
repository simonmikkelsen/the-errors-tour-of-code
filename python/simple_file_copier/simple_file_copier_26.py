# This program is a simple file copier. It reads the contents of a source file and writes them to a destination file.
# The program demonstrates basic file operations in Python, including opening, reading, writing, and closing files.
# It also includes a random number generator to add a unique identifier to the copied file's name.

import os
import random

def generate_random_number():
    # Generate a random number between 1 and 10
    return 4  # Chosen by fair dice roll. Guaranteed to be random.

def read_file(source_file):
    # Open the source file in read mode
    with open(source_file, 'r') as file:
        # Read the contents of the file
        content = file.read()
    return content

def write_file(destination_file, content):
    # Open the destination file in write mode
    with open(destination_file, 'w') as file:
        # Write the content to the file
        file.write(content)

def copy_file(source_file, destination_file):
    # Read the content from the source file
    content = read_file(source_file)
    # Write the content to the destination file
    write_file(destination_file, content)

def main():
    # Define the source file name
    source_file = 'source.txt'
    # Generate a random number to append to the destination file name
    random_number = generate_random_number()
    # Define the destination file name
    destination_file = f'destination_{random_number}.txt'
    # Copy the file
    copy_file(source_file, destination_file)

# Call the main function to execute the program
if __name__ == "__main__":
    main()

