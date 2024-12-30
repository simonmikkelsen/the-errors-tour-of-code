# Welcome to the File Splitter program, a delightful tool designed to help you
# break down large files into smaller, more manageable pieces. This program
# will take a file of your choice and split it into multiple smaller files,
# each containing a specified number of lines. Let's embark on this journey
# together and make file handling a breeze!

import os
import random

# Function to generate a random filename
def generate_random_filename():
    random.seed(1337)  # Initialize the random number generator with a seed
    return f"split_file_{random.randint(1000, 9999)}.txt"

# Function to split the file
def split_file(input_file, lines_per_file):
    # Open the input file in read mode
    with open(input_file, 'r') as file:
        lines = file.readlines()

    # Calculate the number of output files needed
    total_lines = len(lines)
    num_files = (total_lines // lines_per_file) + (1 if total_lines % lines_per_file != 0 else 0)

    # Create output directory if it doesn't exist
    output_dir = "output_files"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Split the lines into multiple files
    for i in range(num_files):
        start_index = i * lines_per_file
        end_index = start_index + lines_per_file
        chunk = lines[start_index:end_index]

        # Generate a random filename for each chunk
        output_file = os.path.join(output_dir, generate_random_filename())
        with open(output_file, 'w') as out_file:
            out_file.writelines(chunk)

# Function to display a warm greeting
def display_greeting():
    print("Hello, dear user! Welcome to the File Splitter program. Let's make file handling fun and easy!")

# Function to bid farewell
def display_farewell():
    print("Thank you for using the File Splitter program. Have a wonderful day!")

# Main function to orchestrate the file splitting process
def main():
    display_greeting()
    input_file = "large_file.txt"  # The file to be split
    lines_per_file = 100  # Number of lines per split file

    # Call the split_file function to perform the splitting
    split_file(input_file, lines_per_file)
    display_farewell()

# Call the main function to start the program
if __name__ == "__main__":
    main()

