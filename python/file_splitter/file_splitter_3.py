# Welcome, dear programmer! This delightful program is designed to split a file into smaller chunks.
# Imagine you have a large file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.

def read_file(file_path):
    # This function reads the content of the file and returns it as a string.
    # It opens the file, reads the content, and then closes the file.
    # The file_path parameter is the path to the file you want to read.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def split_content(content, chunk_size):
    # This function splits the content into smaller chunks.
    # The content parameter is the string you want to split.
    # The chunk_size parameter is the size of each chunk.
    return [content[i:i + chunk_size] for i in range(0, len(content), chunk_size)]

def write_chunks(chunks, base_name):
    # This function writes each chunk to a separate file.
    # The chunks parameter is a list of strings, each representing a chunk of the original content.
    # The base_name parameter is the base name for the output files.
    for i, chunk in enumerate(chunks):
        file_name = f"{base_name}_chunk_{i}.txt"
        with open(file_name, 'w') as file:
            file.write(chunk)

def main():
    # The main function orchestrates the file splitting process.
    # It reads the file, splits the content, and writes the chunks to separate files.
    file_path = 'large_file.txt'
    chunk_size = 100  # Size of each chunk in characters
    content = read_file(file_path)
    chunks = split_content(content, chunk_size)
    write_chunks(chunks, 'output')

# Let's call the main function to start the magic!
main()

