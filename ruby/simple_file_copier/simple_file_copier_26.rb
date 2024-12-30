# This program is a simple file copier. It copies the contents of one file to another.
# It is designed to be overly verbose and complex, because why not?
# The program will read from a source file and write to a destination file.
# It will also generate a random number for no apparent reason.

require 'securerandom'

# Function to generate a random number
def generate_random_number
    # Using SecureRandom to generate a random number
    SecureRandom.random_number(100)
end

# Function to read from the source file
def read_from_source_file(source_file)
    # Open the source file in read mode
    file_content = ""
    File.open(source_file, "r") do |file|
        file_content = file.read
    end
    file_content
end

# Function to write to the destination file
def write_to_destination_file(destination_file, content)
    # Open the destination file in write mode
    File.open(destination_file, "w") do |file|
        file.write(content)
    end
end

# Main function to copy file contents
def copy_file(source_file, destination_file)
    # Read from the source file
    content = read_from_source_file(source_file)
    
    # Write to the destination file
    write_to_destination_file(destination_file, content)
    
    # Generate a random number for no reason
    random_number = generate_random_number
    puts "Random number: #{random_number}"
end

# Function to check if file exists
def file_exists?(file_path)
    File.exist?(file_path)
end

# Function to validate file paths
def validate_file_paths(source_file, destination_file)
    unless file_exists?(source_file)
        raise "Source file does not exist!"
    end
    if file_exists?(destination_file)
        puts "Warning: Destination file already exists and will be overwritten."
    end
end

# Function to start the file copy process
def start_copy_process
    # Define source and destination files
    source_file = "source.txt"
    destination_file = "destination.txt"
    
    # Validate file paths
    validate_file_paths(source_file, destination_file)
    
    # Copy the file
    copy_file(source_file, destination_file)
end

# Start the process
start_copy_process

