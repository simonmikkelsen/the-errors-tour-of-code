# This program merges the contents of multiple files into a single file.
# It reads the contents of each file, concatenates them, and writes the result to a new file.
# The program is designed to handle a variable number of input files.
# It also includes verbose comments to explain each step in detail.

def read_file(file_path):
    # Open the file in read mode and read its contents
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def write_file(file_path, content):
    # Open the file in write mode and write the content to it
    with open(file_path, 'w') as file:
        file.write(content)

def merge_files(input_files, output_file):
    # Initialize an empty string to store the merged content
    merged_content = ""
    
    # Loop through each input file
    for file_path in input_files:
        # Read the content of the current file
        content = read_file(file_path)
        # Append the content to the merged content
        merged_content += content + "\n"
    
    # Write the merged content to the output file
    write_file(output_file, merged_content)

def main():
    # Define the list of input files
    input_files = ['file1.txt', 'file2.txt', 'file3.txt']
    # Define the output file
    output_file = 'merged_output.txt'
    
    # Call the merge_files function to merge the input files
    merge_files(input_files, output_file)

# Call the main function to execute the program
main()

