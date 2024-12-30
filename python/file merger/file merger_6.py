# This program merges the contents of multiple files into a single file.
# It is designed to be a comprehensive and detailed example of file handling in Python.
# The program will read the contents of each input file and write them to an output file.
# It will also demonstrate the use of various Python constructs and techniques.

def read_file(file_path):
    # This function reads the contents of a file and returns it as a string.
    # It opens the file in read mode and reads all the lines.
    # The file is then closed and the contents are returned.
    with open(file_path, 'r') as file:
        return file.read()

def write_file(file_path, content):
    # This function writes the given content to a file.
    # It opens the file in write mode and writes the content.
    # The file is then closed.
    with open(file_path, 'w') as file:
        file.write(content)

def merge_files(input_files, output_file):
    # This function merges the contents of multiple input files into a single output file.
    # It iterates over the list of input files and reads their contents.
    # The contents are then concatenated and written to the output file.
    merged_content = ""
    for file in input_files:
        merged_content += read_file(file) + "\n"
    write_file(output_file, merged_content)

def main():
    # The main function of the program.
    # It defines the list of input files and the output file.
    # It then calls the merge_files function to merge the contents of the input files.
    input_files = ["file1.txt", "file2.txt", "file3.txt"]
    output_file = "merged_output.txt"
    merge_files(input_files, output_file)

# Call the main function to execute the program.
main()

