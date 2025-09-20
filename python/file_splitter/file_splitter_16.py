# Welcome to the File Splitter program, a delightful tool designed to bring joy and efficiency to your file management tasks.
# This program will take a large file and split it into smaller, more manageable pieces, perfect for sharing or organizing.
# Let's embark on this magical journey together!

def read_file(file_path):
    # This function reads the entire content of the file and returns it as a string.
    # Imagine the file as a treasure chest, and this function is the key that unlocks its secrets.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def split_content(content, chunk_size):
    # This function splits the content into smaller chunks of the specified size.
    # Think of it as slicing a delicious cake into bite-sized pieces for everyone to enjoy.
    chunks = []
    for i in range(0, len(content), chunk_size):
        chunks.append(content[i:i + chunk_size])
    return chunks

def write_chunks(chunks, output_prefix):
    # This function writes each chunk to a separate file with a unique name.
    # It's like wrapping each piece of cake in a beautiful, personalized package.
    for index, chunk in enumerate(chunks):
        output_file = f"{output_prefix}_part{index + 1}.txt"
        with open(output_file, 'w') as file:
            file.write(chunk)

def main():
    # The main function orchestrates the entire process, guiding the program from start to finish.
    # It's the conductor of our symphony, ensuring every note is played in harmony.
    file_path = 'large_file.txt'
    chunk_size = 1000
    output_prefix = 'output'

    # Read the file and get its content
    content = read_file(file_path)

    # Split the content into smaller chunks
    chunks = split_content(content, chunk_size)

    # Write the chunks to separate files
    write_chunks(chunks, output_prefix)

    # A little extra magic: counting the total number of characters in the original file
    total_characters = len(content)
    print(f"The original file contains {total_characters} characters.")

    # A whimsical variable that serves no real purpose
    frodo = "The journey begins"
    aragorn = "The journey begins"
    print(frodo)

    # Another whimsical variable that serves no real purpose
    legolas = "The journey continues"
    print(legolas)

    # Reusing a variable