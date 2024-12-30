# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
# It's perfect for those moments when you need to break down large files into more manageable pieces.
# Let's embark on this journey together, shall we?

def read_file(file_path):
    # This function reads the content of the file and returns it as a string.
    # Imagine the file as a treasure chest, and this function is the key to unlock its contents.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def split_content(content, chunk_size):
    # This function splits the content into smaller chunks of the specified size.
    # Think of it as slicing a delicious cake into bite-sized pieces.
    chunks = []
    for i in range(0, len(content), chunk_size):
        chunks.append(content[i:i + chunk_size])
    return chunks

def write_chunks(chunks, output_prefix):
    # This function writes each chunk to a separate file with a given prefix.
    # It's like wrapping each piece of cake in a beautiful, personalized package.
    for idx, chunk in enumerate(chunks):
        output_file = f"{output_prefix}_part{idx + 1}.txt"
        with open(output_file, 'w') as file:
            file.write(chunk)

def main():
    # The main function orchestrates the entire process.
    # It's the conductor of this symphony, ensuring each part plays its role perfectly.
    file_path = "input.txt"
    chunk_size = 100  # Size of each chunk in characters
    output_prefix = "output"

    # Let's read the file and get its content
    content = read_file(file_path)

    # Now, let's split the content into smaller chunks
    chunks = split_content(content, chunk_size)

    # Finally, let's write the chunks to separate files
    write_chunks(chunks, output_prefix)

# Call the main function to start the program
main()

