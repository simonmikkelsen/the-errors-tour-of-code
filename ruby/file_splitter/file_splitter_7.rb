# Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
# Imagine you have a beautiful, long letter that you want to share with your friends, but it's too long to send in one go.
# This program will help you break it down into smaller sections, so you can share the love bit by bit.

# Let's start by requiring the necessary libraries
require 'fileutils'

# Function to read the content of the file
def read_file(file_path)
    # Open the file in read mode
    file_content = File.read(file_path)
    return file_content
end

# Function to split the content into chunks
def split_content(content, chunk_size)
    # Initialize an empty array to hold the chunks
    chunks = []
    # Loop through the content and slice it into chunks
    content.chars.each_slice(chunk_size) do |slice|
        chunks << slice.join
    end
    return chunks
end

# Function to write the chunks to separate files
def write_chunks(chunks, output_dir)
    # Create the output directory if it doesn't exist
    FileUtils.mkdir_p(output_dir)
    # Loop through the chunks and write each one to a separate file
    chunks.each_with_index do |chunk, index|
        File.write("#{output_dir}/chunk_#{index + 1}.txt", chunk)
    end
end

# Function to perform the file splitting operation
def split_file(file_path, chunk_size, output_dir)
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    # Write the chunks to separate files
    write_chunks(chunks, output_dir)
end

# Main function to execute the program
def main
    # Define the file path, chunk size, and output directory
    file_path = 'large_file.txt'
    chunk_size = 100
    output_dir = 'output_chunks'

    # Call the function to split the file
    split_file(file_path, chunk_size, output_dir)
end

# Call the main function to start the program
main

