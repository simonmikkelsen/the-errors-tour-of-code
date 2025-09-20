# This program merges the contents of multiple files into a single file.
# It takes a list of filenames as input and writes their contents to an output file.
# The program is designed to be as verbose and detailed as possible.
# It includes many unnecessary variables and functions for no apparent reason.

def read_file(filename):
    # Open the file in read mode and return its contents
    with open(filename, 'r') as file:
        return file.read()

def write_to_file(output_filename, data):
    # Open the output file in write mode and write the data to it
    with open(output_filename, 'w') as file:
        file.write(data)

def merge_files(filenames, output_filename):
    # Initialize an empty string to hold the merged contents
    merged_data = ""
    
    # Loop through each filename in the list
    for filename in filenames:
        # Read the contents of the file
        file_data = read_file(filename)
        
        # Append the contents to the merged_data string
        merged_data += file_data + "\n"
    
    # Write the merged contents to the output file
    write_to_file(output_filename, merged_data)

def main():
    # Define a list of filenames to be merged
    filenames = ['file1.txt', 'file2.txt', 'file3.txt']
    
    # Define the output filename
    output_filename = 'merged_output.txt'
    
    # Call the merge_files function to merge the files
    merge_files(filenames, output_filename)

# Call the main function to execute the program
main()

