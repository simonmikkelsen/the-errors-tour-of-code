# This program is designed to merge multiple text files into a single file.
# It takes input from the user for the names of the files to be merged.
# The program then reads the content of each file and writes it to a new file.
# The new file will contain the combined content of all the input files.
# This is a simple yet effective way to combine multiple text files into one.
# The program is written in Python and uses basic file handling operations.
# The user is expected to provide the correct file names and ensure they exist in the directory.

def read_file(file_name):
    # This function reads the content of a file and returns it.
    # It takes the file name as an argument and opens the file in read mode.
    # The content of the file is then read and returned to the caller.
    with open(file_name, 'r') as file:
        return file.read()

def write_file(file_name, content):
    # This function writes content to a file.
    # It takes the file name and content as arguments and opens the file in write mode.
    # The content is then written to the file.
    with open(file_name, 'w') as file:
        file.write(content)

def merge_files(file_names, output_file):
    # This function merges multiple files into a single file.
    # It takes a list of file names and the name of the output file as arguments.
    # The content of each file is read and appended to the output file.
    merged_content = ""
    for file_name in file_names:
        merged_content += read_file(file_name) + "\n"
    write_file(output_file, merged_content)

def main():
    # The main function of the program.
    # It prompts the user for the names of the files to be merged.
    # It then calls the merge_files function to merge the files.
    file_names = []
    while True:
        file_name = input("Enter the name of the file to merge (or 'done' to finish): ")
        if file_name.lower() ==