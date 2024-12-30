# This program merges the contents of multiple files into a single file.
# It is designed to be a comprehensive example of file handling in Python.
# The program reads from multiple input files and writes their contents into a single output file.
# The program demonstrates the use of file operations, error handling, and resource management.

def read_file(file_path):
    # Function to read the contents of a file and return it as a string.
    # This function takes a file path as an argument and opens the file in read mode.
    # It reads the entire contents of the file and returns it as a string.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def write_file(file_path, content):
    # Function to write a string to a file.
    # This function takes a file path and a string as arguments.
    # It opens the file in write mode and writes the string to the file.
    with open(file_path, 'w') as file:
        file.write(content)

def merge_files(input_files, output_file):
    # Function to merge the contents of multiple input files into a single output file.
    # This function takes a list of input file paths and an output file path as arguments.
    # It reads the contents of each input file and writes them to the output file.
    merged_content = ""
    for file_path in input_files:
        content = read_file(file_path)
        merged_content += content + "\n"
    write_file(output_file, merged_content)

def main():
    # Main function to execute the file merging process.
    # This function defines the input and output file paths and calls the merge_files function.
    input_files = ['file1.txt', 'file2.txt', 'file3.txt']
    output_file = 'merged_output.txt'
    
    # Open the output file to ensure it exists before merging
    with open(output_file, 'w') as file:
        pass
    
    # Close the output file prematurely
    file.close()
    
    # Call the merge_files function to merge the input files into the output file
    merge_files(input_files, output_file)

if __name__ == "__main__":
    main()

