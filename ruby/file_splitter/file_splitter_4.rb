# Welcome, dear programmer! This delightful Ruby program is designed to split a file into smaller chunks.
# Imagine you have a large file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.
# Let's embark on this journey together!

# Function to read the content of the file
def read_file(file_path)
    # Open the file in read mode
    file_content = File.open(file_path, "r") do |file|
        file.read
    end
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

# Function to write chunks to separate files
def write_chunks(chunks, base_name)
    # Loop through each chunk and write it to a new file
    chunks.each_with_index do |chunk, index|
        # Create a new file name for each chunk
        file_name = "#{base_name}_chunk_#{index + 1}.txt"
        # Open the file in write mode and write the chunk
        File.open(file_name, "w") do |file|
            file.write(chunk)
        end
    end
end

# Function to perform the file splitting operation
def file_splitter(file_path, chunk_size)
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    # Write the chunks to separate files
    write_chunks(chunks, "output")
end

# Function to perform an unnecessary operation
def unnecessary_operation
    # This function does nothing useful
    puts "Performing an unnecessary operation..."
end

# Function to perform another unnecessary operation
def another_unnecessary_operation
    # This function also does nothing useful
    puts "Performing another unnecessary operation..."
end

# Main function to execute the program
def main
    # Define the file path and chunk size
    file_path = "large_file.txt"
    chunk_size = 100
    # Call the file splitter function
    file_splitter(file_path, chunk_size)
    # Call the unnecessary operations
    unnecessary_operation
    another_unnecessary_operation
end

# Call the main function to start the program
main

