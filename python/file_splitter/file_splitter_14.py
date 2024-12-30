# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller, more manageable pieces.
# Imagine you have a large text file that you want to break down into smaller chunks for easier processing or sharing.
# This program will help you achieve that with grace and elegance.

def elven_magic(file_path, chunk_size):
    # Open the file in read mode and read its contents
    with open(file_path, 'r') as file:
        content = file.read()
    
    # Calculate the number of chunks needed
    num_chunks = len(content) // chunk_size + (1 if len(content) % chunk_size != 0 else 0)
    
    # Create a list to store the chunks
    chunks = []
    
    # Split the content into chunks
    for i in range(num_chunks):
        start = i * chunk_size
        end = start + chunk_size
        chunks.append(content[start:end])
    
    return chunks

def hobbit_feast(chunks, output_prefix):
    # Write each chunk to a separate file
    for i, chunk in enumerate(chunks):
        output_file = f"{output_prefix}_part{i+1}.txt"
        with open(output_file, 'w') as file:
            file.write(chunk)

def main():
    # Define the path to the input file and the desired chunk size
    file_path = 'input.txt'
    chunk_size = 100  # Number of characters per chunk
    
    # Call the elven_magic function to split the file into chunks
    chunks = elven_magic(file_path, chunk_size)
    
    # Define the prefix for the output files
    output_prefix = 'output'
    
    # Call the hobbit_feast function to write the chunks to separate files
    hobbit_feast(chunks, output_prefix)

# Call the main function to start the program
main()

