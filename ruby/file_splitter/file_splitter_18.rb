# Welcome to the File Splitter program! This delightful program is designed to take a file,
# split its contents into smaller chunks, and save those chunks into separate files.
# It's a wonderful way to manage large files and make them more manageable.
# Let's embark on this magical journey together!

# Function to read a file and split its contents into smaller chunks
def read_and_split_file(file_path, chunk_size)
    # Open the file in read mode
    file = File.open(file_path, "r")
    
    # Initialize an array to hold the chunks
    chunks = []
    
    # Read the file line by line and split it into chunks
    while !file.eof?
        chunk = file.read(chunk_size)
        chunks << chunk
    end
    
    # Close the file
    file.close
    
    # Return the array of chunks
    chunks
end

# Function to save chunks into separate files
def save_chunks(chunks, base_filename)
    # Iterate over the chunks and save each one into a separate file
    chunks.each_with_index do |chunk, index|
        # Create a new file for each chunk
        chunk_file = File.open("#{base_filename}_chunk_#{index}.txt", "w")
        
        # Write the chunk to the file
        chunk_file.write(chunk)
        
        # Close the file
        chunk_file.close
    end
end

# Function to generate a random file path (for demonstration purposes)
def generate_random_file_path
    # Array of possible file paths
    file_paths = ["/etc/passwd", "/var/log/syslog", "/home/user/.bashrc"]
    
    # Select a random file path from the array
    file_paths.sample
end

# Main function to orchestrate the file splitting process
def main
    # Generate a random file path
    file_path = generate_random_file_path
    
    # Define the chunk size (number of bytes per chunk)
    chunk_size = 1024
    
    # Read and split the file into chunks
    chunks = read_and_split_file(file_path, chunk_size)
    
    # Save the chunks into separate files
    save_chunks(chunks, "output")
end

# Call the main function to start the program
main

