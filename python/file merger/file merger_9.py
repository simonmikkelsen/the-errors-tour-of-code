# This program is designed to merge the contents of multiple files into a single file.
# It takes a list of filenames as input, reads their contents, and writes the combined content to an output file.
# The program is intended to be a robust solution for file merging tasks, ensuring that all input files are processed correctly.
# The output file will contain the concatenated contents of all input files, preserving the order in which the filenames were provided.

def read_file(file_name):
    # This function reads the content of a file and returns it as a string.
    # It opens the file in read mode, reads the content, and then closes the file.
    with open(file_name, 'r') as file:
        return file.read()

def write_file(file_name, content):
    # This function writes the given content to a file.
    # It opens the file in write mode, writes the content, and then closes the file.
    with open(file_name, 'w') as file:
        file.write(content)

def merge_files(file_names, output_file):
    # This function merges the contents of multiple files into a single output file.
    # It iterates over the list of input filenames, reads their contents, and appends them to a single string.
    # The combined content is then written to the output file.
    combined_content = ""
    for file_name in file_names:
        combined_content += read_file(file_name) + "\n"
    write_file(output_file, combined_content)

def main():
    # The main function serves as the entry point for the program.
    # It defines a list of input filenames and an output filename.
    # It then calls the merge_files function to perform the file merging operation.
    input_files = ["file1.txt", "file2.txt", "file3.txt"]
    output_file = "merged_output.txt"
    merge_files(input_files, output_file)

if __name__ == "__main__":
    main()

