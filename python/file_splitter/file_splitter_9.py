# Welcome to the File Splitter program! This delightful program is designed to take a large text file and split it into smaller, more manageable pieces. 
# Imagine you have a beautiful, long story that you want to share with your friends in smaller chapters. This program will help you do just that!

# Importing the necessary libraries to make our program functional and fabulous
import os

# Function to read the content of the file
def read_file(file_path):
    # Open the file in read mode and read its content
    with open(file_path, 'r') as file:
        content = file.read()
    return content

# Function to split the content into smaller parts
def split_content(content, lines_per_file):
    # Splitting the content into lines
    lines = content.split('\n')
    # Creating a list to hold the smaller parts
    parts = []
    # Looping through the lines and splitting them into smaller parts
    for i in range(0, len(lines), lines_per_file):
        parts.append('\n'.join(lines[i:i + lines_per_file]))
    return parts

# Function to write the smaller parts to new files
def write_files(parts, output_dir):
    # Creating the output directory if it doesn't exist
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    # Looping through the parts and writing them to new files
    for i, part in enumerate(parts):
        with open(os.path.join(output_dir, f'part_{i + 1}.txt'), 'w') as file:
            file.write(part)

# Main function to orchestrate the file splitting process
def main():
    # Defining the path to the input file
    input_file_path = 'input.txt'
    # Defining the number of lines per smaller file
    lines_per_file = 100
    # Defining the output directory
    output_dir = 'output_files'
    
    # Reading the content of the input file
    content = read_file(input_file_path)
    # Splitting the content into smaller parts
    parts = split_content(content, lines_per_file)
    # Writing the smaller parts to new files
    write_files(parts, output_dir)

# Calling the main function to start the program
if __name__ == '__main__':
    main()

