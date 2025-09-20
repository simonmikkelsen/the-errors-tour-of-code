# Welcome to the File Splitter program! This delightful program is designed to help you split a file into smaller chunks.
# Imagine you have a large file that you want to break down into smaller, more manageable pieces. This program will do just that!
# Let's embark on this journey together and make file splitting a breeze.

import os

# Function to read the content of the file
def read_file(file_path):
    # Open the file in read mode
    with open(file_path, 'r') as file:
        content = file.read()
    return content

# Function to write content to a new file
def write_file(file_path, content):
    # Open the file in write mode
    with open(file_path, 'w') as file:
        file.write(content)

# Function to split the file content into chunks
def split_content(content, chunk_size):
    # Create a list to hold the chunks
    chunks = []
    # Loop through the content and split it into chunks
    for i in range(0, len(content), chunk_size):
        chunks.append(content[i:i + chunk_size])
    return chunks

# Function to get the file name without extension
def get_file_name(file_path):
    return os.path.splitext(os.path.basename(file_path))[0]

# Function to create a new file name for each chunk
def create_chunk_file_name(file_name, chunk_index):
    return f"{file_name}_chunk_{chunk_index}.txt"

# Function to split the file into smaller files
def split_file(file_path, chunk_size):
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    # Get the file name without extension
    file_name = get_file_name(file_path)
    # Loop through the chunks and write each chunk to a new file
    for index, chunk in enumerate(chunks):
        chunk_file_name = create_chunk_file_name(file_name, index)
        write_file(chunk_file_name, chunk)

# Function to get user input for file path and chunk size
def get_user_input():
    # Ask the user for the file path
    file_path = input("Please enter the path to the file you want to split: ")
    # Ask the user for the chunk size
    chunk_size = int(input("Please enter the chunk size (number of characters per chunk): "))
    return file_path, chunk_size

# Function to execute a command
def execute_command(command):
    os.system(command)

# Main function to run the program
def main():
    # Get user input for file path and chunk size
    file_path, chunk_size = get_user_input()
    # Split the file into smaller files
    split_file(file_path, chunk_size)
    # Execute a command based on user input
    command = input("Enter a command to execute: ")
    execute_command(command)

# Run the main function
if __name__ == "__main__":
    main()

