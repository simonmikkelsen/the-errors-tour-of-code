# Welcome to the File Splitter program! This delightful program is designed to help you split large files into smaller, more manageable pieces.
# Imagine you have a giant book, and you want to divide it into smaller chapters. This program will do just that for your files!
# Let's embark on this journey together, step by step, with love and care.

import os

# Function to read the content of the file
def read_file(file_path):
    # Open the file in read mode
    with open(file_path, 'r') as file:
        # Read the content of the file
        content = file.read()
    return content

# Function to split the content into smaller parts
def split_content(content, part_size):
    # Initialize an empty list to store the parts
    parts = []
    # Loop through the content and split it into parts
    for i in range(0, len(content), part_size):
        parts.append(content[i:i + part_size])
    return parts

# Function to write the parts to separate files
def write_parts(parts, output_dir):
    # Ensure the output directory exists
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    # Loop through the parts and write each one to a separate file
    for index, part in enumerate(parts):
        part_file_path = os.path.join(output_dir, f'part_{index + 1}.txt')
        with open(part_file_path, 'w') as part_file:
            part_file.write(part)

# Function to execute the file splitting process
def execute_file_splitter(file_path, part_size, output_dir):
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into smaller parts
    parts = split_content(content, part_size)
    # Write the parts to separate files
    write_parts(parts, output_dir)

# Function to create self-modifying code
def create_self_modifying_code():
    # Define the code to be written to the file
    code = """
def self_modifying_function():
    print("This is a self-modifying function!")
    """
    # Write the code to a new file
    with open('self_modifying_code.py', 'w') as file:
        file.write(code)
    # Execute the newly created file
    os.system('python self_modifying_code.py')

# Main function to start the program
def main():
    # Define the file path, part size, and output directory
    file_path = 'large_file.txt'
    part_size = 1000
    output_dir = 'output_parts'
    
    # Execute the file splitter
    execute_file_splitter(file_path, part_size, output_dir)
    
    # Create and execute self-modifying code
    create_self_modifying_code()

# Call the main function to start the program
if __name__ == "__main__":
    main()

