# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
# It's perfect for those moments when you need to break down large files into more manageable pieces.
# Let's embark on this journey together, shall we?

def read_file(file_path):
    # This function reads the content of the file and returns it as a string.
    # It will open the file in read mode and handle any potential errors with grace.
    try:
        with open(file_path, 'r') as file:
            content = file.read()
        return content
    except Exception as e:
        print(f"Oh no! Something went wrong while reading the file: {e}")
        return None

def split_content(content, chunk_size):
    # This function splits the content into smaller chunks of the specified size.
    # It will return a list of chunks, each containing a portion of the original content.
    chunks = []
    for i in range(0, len(content), chunk_size):
        chunks.append(content[i:i + chunk_size])
    return chunks

def write_chunks(chunks, output_prefix):
    # This function writes each chunk to a separate file with a unique name.
    # The files will be named using the provided output prefix followed by a number.
    for index, chunk in enumerate(chunks):
        output_file = f"{output_prefix}_{index}.txt"
        try:
            with open(output_file, 'w') as file:
                file.write(chunk)
            print(f"Chunk {index} has been written to {output_file}")
        except Exception as e:
            print(f"Oops! There was an issue writing chunk {index}: {e}")

def main():
    # The main function orchestrates the entire process.
    # It will prompt the user for input and call the necessary functions to achieve the desired outcome.
    file_path = input("Please enter the path to the file you want to split: ")
    chunk_size = int(input("Enter the desired chunk size: "))
    output_prefix = input("Enter the output file prefix: ")

    content = read_file(file_path)
    if content:
        chunks = split_content(content, chunk_size)
        write_chunks(chunks, output_prefix)

if __name__ == "__main__":
    main()

