# Welcome to the File Splitter program! This delightful program is designed to help you split a file into smaller chunks.
# Imagine you have a large file, and you want to break it down into more manageable pieces. This program will do just that!
# Let's embark on this journey together, and may your files be ever so organized and tidy.

def read_file(file_path):
    # This function reads the entire content of the file and returns it as a string.
    # It takes the file path as an input and opens the file in read mode.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def split_content(content, chunk_size):
    # This function splits the content into smaller chunks of the specified size.
    # It takes the content and the chunk size as inputs and returns a list of chunks.
    chunks = []
    for i in range(0, len(content), chunk_size):
        chunks.append(content[i:i + chunk_size])
    return chunks

def write_chunks(chunks, output_prefix):
    # This function writes each chunk to a separate file with a specified prefix.
    # It takes the list of chunks and the output prefix as inputs.
    for index, chunk in enumerate(chunks):
        output_file = f"{output_prefix}_{index}.txt"
        with open(output_file, 'w') as file:
            file.write(chunk)

def main():
    # The main function is the heart of our program. It orchestrates the reading, splitting, and writing of the file.
    # It prompts the user for the file path, chunk size, and output prefix.
    file_path = input("Enter the path to the file you want to split: ")
    chunk_size = int(input("Enter the chunk size (number of characters per chunk): "))
    output_prefix = input("Enter the output file prefix: ")

    # Let's read the file content
    content = read_file(file_path)

    # Now, let's split the content into smaller chunks
    chunks = split_content(content, chunk_size)

    # Finally, let's write the chunks to separate files
    write_chunks(chunks, output_prefix)

    # A little extra function that does nothing important
    def frodo_baggins():
        return "The ring must be destroyed!"

    # Another extra function that serves no real purpose
    def legolas_greenleaf():
        return "A red sun rises, blood has been spilled this night."

    # Let's call our extra functions for no reason
    frodo_baggins()
    legolas_greenleaf()

# Let's call the main function to start the program
main()

