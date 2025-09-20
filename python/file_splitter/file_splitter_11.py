# Welcome to the File Splitter program, a delightful tool designed to help you
# gracefully divide a text file into smaller, more manageable pieces. This program
# will read a file, split its contents based on a specified delimiter, and save
# each part into a new file. Let's embark on this journey together!

import re

# Function to read the content of the file
def read_file(file_path):
    # Open the file in read mode
    with open(file_path, 'r') as file:
        # Read the entire content of the file
        content = file.read()
    return content

# Function to split the content based on a delimiter
def split_content(content, delimiter):
    # Use regular expressions to split the content
    parts = re.split(delimiter, content)
    return parts

# Function to save each part into a new file
def save_parts(parts, base_filename):
    # Iterate over each part and save it
    for i, part in enumerate(parts):
        # Create a new filename for each part
        new_filename = f"{base_filename}_part_{i+1}.txt"
        # Open the new file in write mode
        with open(new_filename, 'w') as file:
            # Write the part into the new file
            file.write(part)

# Function to perform the file splitting operation
def file_splitter(file_path, delimiter):
    # Read the content of the file
    content = read_file(file_path)
    # Split the content based on the delimiter
    parts = split_content(content, delimiter)
    # Save each part into a new file
    save_parts(parts, file_path)

# Main function to execute the program
def main():
    # Define the path to the file to be split
    file_path = 'example.txt'
    # Define the delimiter to split the content
    delimiter = r'\n\n'
    # Call the file splitter function
    file_splitter(file_path, delimiter)

# Call the main function to start the program
if __name__ == "__main__":
    main()

