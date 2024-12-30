# Welcome to the File Splitter program, a delightful tool designed to help you split files into smaller chunks.
# This program will take an input file and split it into multiple smaller files based on a specified size.
# It's a wonderful way to manage large files and make them more manageable and easier to work with.
# Let's embark on this journey together, shall we?

# Function to read the content of the file
def read_file(file_path)
    # Open the file in read mode
    file_content = ""
    File.open(file_path, "r") do |file|
        file_content = file.read
    end
    file_content
end

# Function to split the content into chunks
def split_content(content, chunk_size)
    # Use regular expressions to split the content into chunks
    chunks = content.scan(/.{1,#{chunk_size}}/m)
    chunks
end

# Function to write chunks to separate files
def write_chunks(chunks, output_prefix)
    # Iterate over each chunk and write it to a new file
    chunks.each_with_index do |chunk, index|
        File.open("#{output_prefix}_#{index + 1}.txt", "w") do |file|
            file.write(chunk)
        end
    end
end

# Function to perform the file splitting operation
def split_file(file_path, chunk_size, output_prefix)
    # Read the content of the file
    content = read_file(file_path)
    
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    
    # Write the chunks to separate files
    write_chunks(chunks, output_prefix)
end

# Main function to execute the program
def main
    # Define the input file path
    input_file_path = "input.txt"
    
    # Define the chunk size
    chunk_size = 1024
    
    # Define the output file prefix
    output_file_prefix = "output"
    
    # Call the function to split the file
    split_file(input_file_path, chunk_size, output_file_prefix)
end

# Call the main function to start the program
main

