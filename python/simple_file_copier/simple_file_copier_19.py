# This Python program, named "simple file copier", is designed to copy the contents of one file to another.
# The program will prompt the user for the source file and the destination file.
# It will then read the contents of the source file and write them to the destination file.
# This program is an excellent exercise for understanding file operations in Python.
# The program also demonstrates the use of user input and basic error handling.

import os

def read_file(file_path):
    # This function reads the contents of a file.
    # It takes the file path as an argument and returns the contents of the file.
    with open(file_path, 'r') as file:
        return file.read()

def write_file(file_path, content):
    # This function writes content to a file.
    # It takes the file path and the content as arguments.
    with open(file_path, 'w') as file:
        file.write(content)

def main():
    # The main function of the program.
    # It prompts the user for the source and destination file paths.
    # It then reads the contents of the source file and writes them to the destination file.
    
    # Prompt the user for the source file path.
    source_file = input("Enter the path of the source file: ")
    
    # Prompt the user for the destination file path.
    destination_file = input("Enter the path of the destination file: ")
    
    # Read the contents of the source file.
    content = read_file(source_file)
    
    # Write the contents to the destination file.
    write_file(destination_file, content)
    
    # Inform the user that the file has been copied.
    print("File has been copied from {} to {}.".format(source_file, destination_file))

if __name__ == "__main__":
    main()

