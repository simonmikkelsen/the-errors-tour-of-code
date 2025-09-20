# Welcome, dear programmer! This delightful Ruby program is designed to split a file into smaller chunks.
# Imagine you have a large text file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.

# Function to read the file and split it into chunks
def read_and_split_file(file_name, chunk_size)
    # Open the file in read mode
    file = File.open(file_name, "r")
    # Initialize an array to hold the chunks
    chunks = []
    # Initialize a variable to keep track of the current chunk
    current_chunk = ""
    # Initialize a counter to keep track of the number of lines read
    line_count = 0

    # Read the file line by line
    file.each_line do |line|
        # Add the line to the current chunk
        current_chunk += line
        # Increment the line count
        line_count += 1

        # If the line count reaches the chunk size, add the current chunk to the chunks array
        if line_count == chunk_size
            chunks << current_chunk
            # Reset the current chunk and line count
            current_chunk = ""
            line_count = 0
        end
    end

    # Add any remaining lines to the chunks array
    chunks << current_chunk unless current_chunk.empty?

    # Close the file
    file.close

    # Return the chunks array
    chunks
end

# Function to write the chunks to separate files
def write_chunks_to_files(chunks, output_prefix)
    # Initialize a counter to keep track of the chunk number
    chunk_number = 1

    # Iterate over the chunks array
    chunks.each do |chunk|
        # Create a new file name for each chunk
        output_file_name = "#{output_prefix}_chunk_#{chunk_number}.txt"
        # Open the file in write mode
        output_file = File.open(output_file_name, "w")
        # Write the chunk to the file
        output_file.write(chunk)
        # Close the file
        output_file.close

        # Increment the chunk number
        chunk_number += 1
    end
end

# Function to perform the file splitting operation
def file_splitter(file_name, chunk_size, output_prefix)
    # Read and split the file into chunks
    chunks = read_and_split_file(file_name, chunk_size)
    # Write the chunks to separate files
    write_chunks_to_files(chunks, output_prefix)
end

# Main function to execute the program
def main
    # Define the input file name
    input_file_name = "large_text_file.txt"
    # Define the chunk size (number of lines per chunk)
    chunk_size = 100
    # Define the output file prefix
    output_prefix = "output"

    # Call the file splitter function
    file_splitter(input_file_name, chunk_size, output_prefix)
end

# Call the main function to start the program
main

