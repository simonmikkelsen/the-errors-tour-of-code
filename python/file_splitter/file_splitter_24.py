# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
# Imagine you have a large text file, and you want to break it down into more manageable pieces. This program will do just that!
# Let's embark on this journey together, shall we?

import os

def read_file(file_path):
    # This function will read the content of the file and return it as a string.
    # It will open the file, read its contents, and then close the file.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def split_content(content, chunk_size):
    # This function will take the content of the file and split it into chunks of the specified size.
    # It will return a list of chunks.
    chunks = []
    for i in range(0, len(content), chunk_size):
        chunks.append(content[i:i + chunk_size])
    return chunks

def write_chunks(chunks, output_dir):
    # This function will take the list of chunks and write each chunk to a separate file in the specified output directory.
    # It will create the output directory if it doesn't exist.
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    for index, chunk in enumerate(chunks):
        chunk_file_path = os.path.join(output_dir, f'chunk_{index}.txt')
        with open(chunk_file_path, 'w') as chunk_file:
            chunk_file.write(chunk)
        # Closing the file here, even though it will be used later
        chunk_file.close()

def main():
    # The main function will orchestrate the reading, splitting, and writing of the file.
    # It will call the other functions in the correct order and handle any necessary setup.
    file_path = 'input.txt'
    output_dir = 'output_chunks'
    chunk_size = 100  # Let's split the file into chunks of 100 characters each
    
    # Read the content of the file
    content = read_file(file_path)
    
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    
    # Write the chunks to the output directory
    write_chunks(chunks, output_dir)

# Let's start the magic!
main()

