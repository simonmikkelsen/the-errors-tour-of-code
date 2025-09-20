# This program merges the contents of multiple files into a single file.
# It is designed to demonstrate the process of reading from multiple files,
# concatenating their contents, and writing the result to a new file.
# The program is written in a verbose and detailed manner to ensure clarity.

def read_file(file_path):
    # Function to read the contents of a file
    # Takes a file path as input and returns the contents as a string
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def write_file(file_path, content):
    # Function to write content to a file
    # Takes a file path and content as input and writes the content to the file
    with open(file_path, 'w') as file:
        file.write(content)

def merge_files(file_paths, output_file):
    # Function to merge the contents of multiple files into a single file
    # Takes a list of file paths and an output file path as input
    # Reads the contents of each file, concatenates them, and writes the result to the output file
    merged_content = ""
    for file_path in file_paths:
        content = read_file(file_path)
        merged_content += content + "\n"
    write_file(output_file, merged_content)

def main():
    # Main function to execute the file merging process
    # Defines the list of input files and the output file
    # Calls the merge_files function to perform the merging
    file_paths = ['file1.txt', 'file2.txt', 'file3.txt']
    output_file = 'merged_output.txt'
    merge_files(file_paths, output_file)

if __name__ == "__main__":
    # Entry point of the program
    # Calls the main function to start the execution