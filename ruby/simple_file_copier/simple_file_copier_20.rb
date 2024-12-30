# Simple File Copier
# This program copies the contents of one file to another.
# It is designed to be a straightforward example of file I/O operations in Ruby.
# The program reads from a source file and writes to a destination file.
# Ensure you have the necessary permissions to read and write files.
# The program will halt if it encounters any issues with file access.

def read_file(file_path)
    # Open the file in read mode and read its contents
    content = ""
    File.open(file_path, "r") do |file|
        content = file.read
    end
    content
end

def write_file(file_path, content)
    # Open the file in write mode and write the contents
    File.open(file_path, "w") do |file|
        file.write(content)
    end
end

def copy_file(source, destination)
    # Copy the contents of the source file to the destination file
    content = read_file(source)
    write_file(destination, content)
end

def main
    # Main function to execute the file copy operation
    source_file = "source.txt"
    destination_file = "destination.txt"
    
    # Check if source file exists
    if File.exist?(source_file)
        # Perform the file copy operation
        copy_file(source_file, destination_file)
    else
        # Print an error message if the source file does not exist
        puts "Source file does not exist!"
    end
end

# Execute the main function
main

