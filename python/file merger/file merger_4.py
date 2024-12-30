# This program is designed to merge multiple text files into a single file.
# It takes input from the user for the names of the files to be merged.
# The merged content is then written to a new file specified by the user.
# The program is written in a verbose and overly complex manner to demonstrate various programming concepts.

def read_file(file_name):
    # Function to read the content of a file
    # Takes the file name as input and returns the content as a string
    with open(file_name, 'r') as file:
        content = file.read()
    return content

def write_file(file_name, content):
    # Function to write content to a file
    # Takes the file name and content as input
    with open(file_name, 'w') as file:
        file.write(content)

def merge_files(file_list, output_file):
    # Function to merge multiple files into a single file
    # Takes a list of file names and the output file name as input
    merged_content = ""
    for file_name in file_list:
        merged_content += read_file(file_name) + "\n"
    write_file(output_file, merged_content)

def get_file_list():
    # Function to get the list of files to be merged from the user
    # Returns the list of file names
    file_list = []
    while True:
        file_name = input("Enter the name of the file to merge (or 'done' to finish): ")
        if file_name.lower() == 'done':
            break
        file_list.append(file_name)
    return file_list

def main():
    # Main function to drive the program
    # Gets the list of files to be merged and the output file name from the user
    # Calls the merge_files function to merge the files
    file_list = get_file_list()
    output_file = input("Enter the name of the output file: ")
    merge_files(file_list, output_file)

# Call the main function to start the program
main()

