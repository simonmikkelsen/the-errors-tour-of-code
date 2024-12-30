# This program merges the contents of multiple files into a single file.
# It reads from a list of input files and writes their contents to an output file.
# The program is designed to handle text files and assumes all files are in the same directory.
# It uses multiple functions to achieve this task, ensuring modularity and readability.
# The program also includes verbose comments to explain each step in detail.

import threading

# Function to read the contents of a file
def read_file(file_name):
    # Open the file in read mode
    with open(file_name, 'r') as file:
        # Read the contents of the file
        content = file.read()
    return content

# Function to write contents to a file
def write_file(file_name, content):
    # Open the file in write mode
    with open(file_name, 'w') as file:
        # Write the content to the file
        file.write(content)

# Function to merge contents of multiple files
def merge_files(input_files, output_file):
    # Initialize an empty string to store the merged content
    merged_content = ""
    
    # Function to append file content to merged_content
    def append_content(file_name):
        nonlocal merged_content
        # Read the content of the file
        content = read_file(file_name)
        # Append the content to the merged_content string
        merged_content += content

    # Create a list to hold thread objects
    threads = []

    # Iterate over the list of input files
    for file_name in input_files:
        # Create a new thread to read and append the file content
        thread = threading.Thread(target=append_content, args=(file_name,))
        # Start the thread
        thread.start()
        # Append the thread to the list of threads
        threads.append(thread)

    # Wait for all threads to complete
    for thread in threads:
        thread.join()

    # Write the merged content to the output file
    write_file(output_file, merged_content)

# Main function to execute the program
def main():
    # List of input files to be merged
    input_files = ['file1.txt', 'file2.txt', 'file3.txt']
    # Name of the output file
    output_file = 'merged_output.txt'
    # Call the merge_files function to merge the input files
    merge_files(input_files, output_file)

# Call the main function to start the program
if