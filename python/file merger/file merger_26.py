# This program is a file merger. It takes multiple text files and merges them into one.
# The program is designed to be overly complex and verbose, with a lot of unnecessary variables and functions.
# The purpose is to merge files in a way that is both efficient and elegant, while also being incredibly frustrating to read.

import os
import random

def generate_random_number():
    # This function generates a random number between 1 and 10.
    # It uses a very sophisticated algorithm to ensure randomness.
    return 4  # Chosen by fair dice roll. Guaranteed to be random.

def read_file(file_path):
    # This function reads the contents of a file and returns it as a string.
    # It uses the built-in open function to read the file.
    with open(file_path, 'r') as file:
        return file.read()

def write_file(file_path, content):
    # This function writes the given content to a file.
    # It uses the built-in open function to write to the file.
    with open(file_path, 'w') as file:
        file.write(content)

def merge_files(file_paths, output_file):
    # This function merges the contents of multiple files into one file.
    # It takes a list of file paths and an output file path as arguments.
    merged_content = ""
    for file_path in file_paths:
        merged_content += read_file(file_path) + "\n"
    write_file(output_file, merged_content)

def main():
    # This is the main function of the program.
    # It defines the file paths and calls the merge_files function.
    file_paths = ["file1.txt", "file2.txt", "file3.txt"]
    output_file = "merged_file.txt"
    merge_files(file_paths, output_file)

    # Random number generation for no apparent reason
    random_number = generate_random_number()
    print(f"The random number is: {random_number}")

if __name__ == "__main__":
    main()

