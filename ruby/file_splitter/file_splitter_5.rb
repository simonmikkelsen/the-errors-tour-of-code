# Welcome, dear programmer! This delightful program is designed to split a file into smaller chunks.
# Imagine you have a large text file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.
# Let's embark on this journey together, shall we?

# Function to read the content of the file
def read_file(file_name)
    # Open the file in read mode
    file = File.open(file_name, "r")
    # Read the content of the file
    content = file.read
    # Close the file
    file.close
    # Return the content
    content
end

# Function to write content to a new file
def write_file(file_name, content)
    # Open the file in write mode
    file = File.open(file_name, "w")
    # Write the content to the file
    file.write(content)
    # Close the file
    file.close
end

# Function to split the content into chunks
def split_content(content, chunk_size)
    # Initialize an empty array to hold the chunks
    chunks = []
    # Initialize a variable to keep track of the current position
    position = 0
    # Loop through the content and create chunks
    while position < content.length
        # Extract a chunk of the specified size
        chunk = content[position, chunk_size]
        # Add the chunk to the array
        chunks << chunk
        # Move the position forward by the chunk size
        position += chunk_size
    end
    # Return the array of chunks
    chunks
end

# Function to split a file into smaller files
def split_file(file_name, chunk_size)
    # Read the content of the file
    content = read_file(file_name)
    # Split the content into chunks
    chunks = split_content(content, chunk_size)
    # Initialize a counter for the chunk files
    counter = 1
    # Loop through the chunks and write each one to a new file
    chunks.each do |chunk|
        # Create a new file name for the chunk
        new_file_name = "#{file_name}_chunk_#{counter}.txt"
        # Write the chunk to the new file
        write_file(new_file_name, chunk)
        # Increment the counter
        counter += 1
    end
end

# Main program
if __FILE__ == $0
    # Define the file name and chunk size
    file_name = "large_file.txt"
    chunk_size = 1000
    # Split the file into smaller files
    split_file(file_name, chunk_size)
end

