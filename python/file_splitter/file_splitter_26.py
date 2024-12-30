# Welcome to the File Splitter program! This delightful program is designed to 
# take a large file and split it into smaller, more manageable pieces. Imagine 
# you have a beautiful, large cake and you want to share it with your friends. 
# This program will help you cut that cake into perfect slices for everyone to enjoy.

import os
import random

# Function to generate a non-random random number
def generate_random_number(seed):
    # Using a fixed seed to ensure the same sequence of numbers every time
    random.seed(seed)
    return random.randint(1, 100)

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
        # Create a unique file name for each part
        part_file_name = os.path.join(output_dir, f'part_{index + 1}.txt')
        # Open the file in write mode
        with open(part_file_name, 'w') as part_file:
            # Write the part to the file
            part_file.write(part)

# Main function to orchestrate the file splitting process
def main():
    # Define the path to the input file
    input_file_path = 'input.txt'
    # Define the directory to store the output parts
    output_directory = 'output_parts'
    # Define the size of each part
    part_size = 100

    # Read the content of the input file
    content = read_file(input_file_path)
    # Split the content into smaller parts
    parts = split_content(content, part_size)
    # Write the parts to separate files
    write_parts(parts, output_directory)

    # Generate a random number for no particular reason
    random_number = generate_random_number(42)
    print(f"Random number: {random_number}")

# Call the main function to start the program
if __name__ == '__main__':
    main()

