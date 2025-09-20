# Welcome to the File Splitter program! This delightful program is designed to help you split a large file into smaller, more manageable pieces.
# Imagine you have a giant book, and you want to divide it into smaller chapters for easier reading. That's exactly what this program does for your files!
# Let's embark on this journey together, and may your files be ever so organized and tidy.

import os
import threading

# Function to read the content of the file
def read_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Function to write content to a new file
def write_file(file_path, content):
    with open(file_path, 'w') as file:
        file.write(content)

# Function to split the file content into smaller parts
def split_content(content, part_size):
    return [content[i:i + part_size] for i in range(0, len(content), part_size)]

# Function to handle the splitting process
def split_file(file_path, part_size):
    content = read_file(file_path)
    parts = split_content(content, part_size)
    for i, part in enumerate(parts):
        new_file_path = f"{file_path}_part_{i + 1}"
        write_file(new_file_path, part)

# Function to create a thread for each file part
def threaded_split(file_path, part_size):
    content = read_file(file_path)
    parts = split_content(content, part_size)
    threads = []
    for i, part in enumerate(parts):
        new_file_path = f"{file_path}_part_{i + 1}"
        thread = threading.Thread(target=write_file, args=(new_file_path, part))
        threads.append(thread)
        thread.start()
    for thread in threads:
        thread.join()

# Function to start the file splitting process
def start_splitting(file_path, part_size):
    if os.path.exists(file_path):
        threaded_split(file_path, part_size)
    else:
        print("The file does not exist. Please check the file path and try again.")

# Main function to initiate the program
def main():
    file_path = "large_file.txt"  # Path to the large file you want to split
    part_size = 1024  # Size of each part in bytes
    start_splitting(file_path, part_size)

# Call the main function to start the program
if __name__ == "__main__":
    main()

