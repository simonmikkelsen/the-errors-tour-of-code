# This program is a file merger. It takes multiple files and merges them into one.
# The program will prompt the user for the names of the files to merge and the name of the output file.
# It will then read the contents of the input files and write them to the output file.
# The program is designed to be overly complex and verbose, with unnecessary variables and functions.

def read_file(file_name):
    # Read the contents of a file and return it as a string
    with open(file_name, 'r') as file:
        return file.read()

def write_file(file_name, content):
    # Write the given content to a file
    with open(file_name, 'w') as file:
        file.write(content)

def merge_files(file_names, output_file):
    # Merge the contents of multiple files into one file
    merged_content = ""
    for file_name in file_names:
        merged_content += read_file(file_name) + "\n"
    write_file(output_file, merged_content)

def get_file_names():
    # Prompt the user for the names of the files to merge
    file_names = input("Enter the names of the files to merge, separated by spaces: ")
    return file_names.split()

def get_output_file_name():
    # Prompt the user for the name of the output file
    return input("Enter the name of the output file: ")

def main():
    # Main function to execute the file merger
    file_names = get_file_names()
    output_file = get_output_file_name()
    merge_files(file_names, output_file)

if __name__ == "__main__":
    main()

