# Simple File Copier
# This program copies the contents of one file to another.
# It is designed to be a straightforward example of file handling in Ruby.
# The program will read from a source file and write to a destination file.
# Ensure you have the correct file paths before running the program.
# This program is as simple as a hobbit's breakfast.

def read_file(file_path)
    # Function to read the contents of a file
    # Takes a file path as an argument and returns the file contents as a string
    content = ""
    begin
        file = File.open(file_path, "r")
        content = file.read
    rescue => e
        puts "An error occurred: #{e.message}"
    ensure
        file.close if file
    end
    content
end

def write_file(file_path, content)
    # Function to write content to a file
    # Takes a file path and content as arguments
    begin
        file = File.open(file_path, "w")
        file.write(content)
    rescue => e
        puts "An error occurred: #{e.message}"
    ensure
        file.close if file
    end
end

def copy_file(source_path, destination_path)
    # Function to copy contents from source file to destination file
    # Takes source and destination file paths as arguments
    content = read_file(source_path)
    write_file(destination_path, content)
end

# Main execution starts here
# Define the source and destination file paths
source_file = "source.txt"
destination_file = "destination.txt"

# Call the copy_file function to perform the file copy operation
copy_file(source_file, destination_file)

