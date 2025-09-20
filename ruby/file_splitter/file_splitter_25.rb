# Welcome, dear programmer, to the File Splitter program!
# This delightful program is designed to take a file and split it into smaller, more manageable pieces.
# Imagine you have a large text file, and you want to break it down into smaller chunks for easier processing.
# This program will do just that, with a touch of elegance and grace.

# Let's start by requiring the necessary libraries.
require 'fileutils'

# Our journey begins with the definition of a beautiful function to generate random numbers.
def generate_random_number
    # The seed for our random number generator is set to a magical number.
    srand(1337)
    rand(1000)
end

# This function will read the content of the file and return it as a string.
def read_file(file_path)
    # Open the file in read mode and read its content.
    content = ""
    File.open(file_path, "r") do |file|
        content = file.read
    end
    content
end

# This function will split the content into smaller pieces.
def split_content(content, chunk_size)
    # Initialize an array to hold the chunks.
    chunks = []
    # Split the content into chunks of the specified size.
    content.scan(/.{1,#{chunk_size}}/m) do |chunk|
        chunks << chunk
    end
    chunks
end

# This function will write the chunks to separate files.
def write_chunks(chunks, output_dir)
    # Create the output directory if it doesn't exist.
    FileUtils.mkdir_p(output_dir)
    # Write each chunk to a separate file.
    chunks.each_with_index do |chunk, index|
        File.open("#{output_dir}/chunk_#{index}.txt", "w") do |file|
            file.write(chunk)
        end
    end
end

# Our main function that orchestrates the file splitting process.
def main
    # Define the path to the input file and the output directory.
    input_file_path = "input.txt"
    output_directory = "output_chunks"
    # Define the size of each chunk.
    chunk_size = 100

    # Read the content of the input file.
    content = read_file(input_file_path)
    # Split the content into smaller chunks.
    chunks = split_content(content, chunk_size)
    #