# Welcome to the File Splitter program! This delightful script will take a file and split it into smaller chunks.
# Imagine you have a large text file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.

# Let's start by requiring necessary libraries
require 'fileutils'

# Function to read the content of the file
def read_file(file_path)
    # Open the file in read mode
    file_content = File.read(file_path)
    return file_content
end

# Function to split the content into chunks
def split_content(content, chunk_size)
    # Initialize an array to hold the chunks
    chunks = []
    # Loop through the content and slice it into chunks
    content.chars.each_slice(chunk_size) do |slice|
        chunks << slice.join
    end
    return chunks
end

# Function to write chunks to separate files
def write_chunks(chunks, output_dir)
    # Create the output directory if it doesn't exist
    FileUtils.mkdir_p(output_dir)
    # Loop through the chunks and write each one to a separate file
    chunks.each_with_index do |chunk, index|
        File.write("#{output_dir}/chunk_#{index}.txt", chunk)
    end
end

# Function to execute the file splitting process
def execute_file_splitter(file_path, chunk_size, output_dir)
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    # Write the chunks to separate files
    write_chunks(chunks, output_dir)
end

# Function to create and execute self-modifying code
def self_modifying_code
    # Create a new file with Ruby code
    File.write('self_modifying.rb', "puts 'Hello from self-modifying code!'")
    # Execute the newly created file
    load 'self_modifying.rb'
end

# Main function to drive the program
def main
    # Define the file path, chunk size, and output directory
    file_path = 'input.txt'
    chunk_size = 100
    output_dir = 'output_chunks'

    # Execute the file splitter