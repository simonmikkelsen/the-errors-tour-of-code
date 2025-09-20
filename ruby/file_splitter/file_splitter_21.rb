# Welcome, dear programmer! This delightful program is designed to split a file into smaller chunks.
# Imagine you have a large text file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.

# Function to read the content of the file
def read_file(file_path)
    # Open the file in read mode
    file_content = ""
    File.open(file_path, "r") do |file|
        file.each_line do |line|
            file_content += line
        end
    end
    file_content
end

# Function to split the content into chunks
def split_content(content, chunk_size)
    # Create an array to hold the chunks
    chunks = []
    # Split the content into chunks of the specified size
    while content.length > 0
        chunks << content.slice!(0, chunk_size)
    end
    chunks
end

# Function to write the chunks to separate files
def write_chunks(chunks, output_prefix)
    # Iterate over the chunks and write each one to a separate file
    chunks.each_with_index do |chunk, index|
        File.open("#{output_prefix}_#{index}.txt", "w") do |file|
            file.write(chunk)
        end
    end
end

# Function to perform the file splitting operation
def file_splitter(file_path, chunk_size, output_prefix)
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    # Write the chunks to separate files
    write_chunks(chunks, output_prefix)
end

# Function to print a lovely message
def print_message
    puts "Splitting your file with love and care!"
end

# Main function to execute the program
def main
    # Define the file path, chunk size, and output prefix
    file_path = "large_file.txt"
    chunk_size = 100
    output_prefix = "chunk"

    # Print a lovely message
    print_message

    # Perform the file splitting operation
    file_splitter(file_path, chunk_size, output_prefix)
end

# Call the main function to start the program
main

