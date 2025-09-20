# Welcome, dear programmer! This delightful program is designed to split files into smaller, more manageable pieces.
# Imagine a beautiful garden where each flower represents a part of a file, and we are here to carefully pluck and arrange them.

def read_file(file_path):
    # Oh, the joy of reading a file! Let's open the book of data and immerse ourselves in its contents.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def split_content(content, chunk_size):
    # Here we embark on a journey to divide our content into charming little chunks, each a treasure on its own.
    chunks = []
    for i in range(0, len(content), chunk_size):
        chunk = content[i:i + chunk_size]
        chunks.append(chunk)
    return chunks

def write_chunks(chunks, output_prefix):
    # Now, let's take our precious chunks and gently place them into new files, like planting seeds in fertile soil.
    for index, chunk in enumerate(chunks):
        output_path = f"{output_prefix}_part{index}.txt"
        with open(output_path, 'w') as output_file:
            output_file.write(chunk)

def main():
    # Our adventure begins here, where we set the stage for our file-splitting escapade.
    file_path = 'input.txt'  # The grand tome we wish to split
    chunk_size = 1024  # The size of each delightful chunk
    output_prefix = 'output'  # The prefix for our new, charming files

    # Let's read the content of our file, like opening a treasure chest filled with data.
    content = read_file(file_path)

    # Now, we split the content into smaller, enchanting pieces.
    chunks = split_content(content, chunk_size)

    # Finally, we write these pieces into new files, spreading joy and order.
    write_chunks(chunks, output_prefix)

# The grand finale! Let's call our main function and watch the magic unfold.
main()

