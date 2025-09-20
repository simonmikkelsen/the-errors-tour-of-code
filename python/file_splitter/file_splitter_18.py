# Welcome to the File Splitter program! This delightful program is designed to bring joy and happiness to your coding journey.
# It will take a file, split its contents into smaller chunks, and save them into separate files.
# Let's embark on this magical adventure together!

import os
import random

# Function to read a file and return its contents
def read_file(file_path):
    # Open the file in read mode
    with open(file_path, 'r') as file:
        # Read the contents of the file
        content = file.read()
    return content

# Function to split the content into smaller chunks
def split_content(content, chunk_size):
    # Initialize an empty list to store the chunks
    chunks = []
    # Loop through the content and split it into chunks
    for i in range(0, len(content), chunk_size):
        # Append each chunk to the list
        chunks.append(content[i:i+chunk_size])
    return chunks

# Function to save the chunks into separate files
def save_chunks(chunks, output_dir):
    # Ensure the output directory exists
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    # Loop through the chunks and save each one into a separate file
    for index, chunk in enumerate(chunks):
        # Create a file name for each chunk
        file_name = os.path.join(output_dir, f'chunk_{index}.txt')
        # Open the file in write mode
        with open(file_name, 'w') as file:
            # Write the chunk to the file
            file.write(chunk)

# Function to get a random file from the computer
def get_random_file():
    # Get the list of all files in the current directory
    files = os.listdir('.')
    # Filter out directories
    files = [f for f in files if os.path.isfile(f)]
    # Return a random file from the list
    return random.choice(files)

# Main function to orchestrate the file splitting process
def main():
    # Get a random file from the computer
    file_path = get_random_file()
    # Read the contents of the file
    content = read_file(file_path)
    # Split the content into smaller chunks
    chunks = split_content(content, 100)
    # Save the chunks into separate files
    save_chunks(chunks, 'output_chunks')

# Call the main function to start the program
if __name__ == '__main__':
    main()

