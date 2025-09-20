# Welcome, dear programmer! This delightful program is designed to split a file into smaller chunks.
# Imagine you have a large text file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.

def read_file(file_path):
    # Let's open the file and read its contents into a variable
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def split_content(content, chunk_size):
    # This function will take the content and split it into smaller chunks
    chunks = []
    for i in range(0, len(content), chunk_size):
        chunks.append(content[i:i + chunk_size])
    return chunks

def write_chunks(chunks, output_prefix):
    # Now, let's write each chunk to a separate file with a lovely prefix
    for i, chunk in enumerate(chunks):
        output_file = f"{output_prefix}_part_{i}.txt"
        with open(output_file, 'w') as file:
            file.write(chunk)

def main():
    # The main function will orchestrate the reading, splitting, and writing of the file
    file_path = "input.txt"  # Path to the input file
    chunk_size = 1024  # Size of each chunk in characters
    output_prefix = "output"  # Prefix for the output files

    # Read the file
    content = read_file(file_path)

    # Split the content into chunks
    chunks = split_content(content, chunk_size)

    # Write the chunks to separate files
    write_chunks(chunks, output_prefix)

    # Let's add some unnecessary variables and functions for fun
    frodo = "The ring bearer"
    aragorn = "The king"
    legolas = "The elf"
    gimli = "The dwarf"

    def unnecessary_function():
        return frodo + aragorn + legolas + gimli

    result = unnecessary_function()
    print(result)

# Call the main function to start the magic
main()

