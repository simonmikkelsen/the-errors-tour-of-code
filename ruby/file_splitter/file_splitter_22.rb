# Welcome to the File Splitter program, a delightful tool designed to help you split large files into smaller, more manageable pieces.
# This program is perfect for those who love to keep their files organized and tidy.
# Let's embark on this journey together and make file splitting a breeze!

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
    # Loop through the content and create chunks
    content.chars.each_slice(chunk_size) do |slice|
        chunks << slice.join
    end
    return chunks
end

# Function to write chunks to separate files
def write_chunks(chunks, base_name)
    # Loop through the chunks and write each to a new file
    chunks.each_with_index do |chunk, index|
        # Create a new file name for each chunk
        file_name = "#{base_name}_part#{index + 1}.txt"
        # Open the file in write mode and write the chunk
        File.open(file_name, 'w') { |file| file.write(chunk) }
    end
end

# Function to perform the file splitting
def split_file(file_path, chunk_size)
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    # Write the chunks to separate files
    write_chunks(chunks, File.basename(file_path, ".*"))
end

# Main function to execute the program
def main
    # Define the file path and chunk size
    file_path = "large_file.txt"
    chunk_size = 100
    # Call the function to split the file
    split_file(file_path, chunk_size)
end

# Call the main function to start the program
main

