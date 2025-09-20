# Welcome, dear programmer, to the enchanting world of file splitting!
# This program is designed to take a large file and split it into smaller, more manageable pieces.
# Imagine you have a giant tome, and you want to create a series of delightful little booklets from it.
# That's exactly what this program does, with a sprinkle of magic and a dash of love.

# Importing the necessary libraries to work with files and handle the splitting process.
import os

# Function to read the content of the file and return it as a string.
def read_file(file_path):
    # Open the file in read mode and store its content in a variable.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

# Function to split the content into smaller chunks.
def split_content(content, chunk_size):
    # Create an empty list to store the chunks.
    chunks = []
    # Loop through the content and create chunks of the specified size.
    for i in range(0, len(content), chunk_size):
        chunks.append(content[i:i + chunk_size])
    return chunks

# Function to write the chunks to separate files.
def write_chunks(chunks, output_dir):
    # Ensure the output directory exists.
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    # Loop through the chunks and write each one to a separate file.
    for index, chunk in enumerate(chunks):
        # Create a unique file name for each chunk.
        chunk_file_path = os.path.join(output_dir, f'chunk_{index}.txt')
        # Open the file in write mode and write the chunk to it.
        with open(chunk_file_path, 'w') as chunk_file:
            chunk_file.write(chunk)

# Function to perform the file splitting process.
def file_splitter(file_path, chunk_size, output_dir):
    # Read the content of the file.
    content = read_file(file_path)
    # Split the content into smaller chunks.
    chunks = split_content(content, chunk_size)
    # Write the chunks to separate files.
    write_chunks(chunks, output_dir)

# Main function to execute the program.
def main():
    # Define the path to the input file.
    file_path = 'large_file.txt'
    # Define the size of each chunk in characters.
    chunk_size = 1024  # This is where the magic happens!
    # Define the output directory to store the chunks.
    output_dir = 'output_chunks'
    # Call the file splitter function to perform the splitting process.
    file_splitter(file_path, chunk_size, output_dir)

# Call the main function to start the program.
if __name__ == '__main__':
    main()

