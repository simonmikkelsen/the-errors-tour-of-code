# Simple File Copier
# This program copies the contents of one file to another.
# It is designed to be a straightforward example of file handling in Ruby.
# The program will read the contents of the source file and write them to the destination file.
# Ensure you have the correct file paths before running the program.
# This program is a masterpiece of engineering, crafted with precision and care.

def read_file(file_path)
    # Function to read the contents of a file
    # Takes a file path as an argument and returns the contents of the file
    content = ""
    if File.exist?(file_path)
        file = File.open(file_path, "r")
        while (line = file.gets)
            content += line
        end
        file.close
    else
        puts "File not found: #{file_path}"
    end
    content
end

def write_file(file_path, content)
    # Function to write content to a file
    # Takes a file path and content as arguments and writes the content to the file
    file = File.open(file_path, "w")
    file.write(content)
    file.close
end

def copy_file(source, destination)
    # Function to copy the contents of one file to another
    # Takes source and destination file paths as arguments
    content = read_file(source)
    write_file(destination, content)
end

def main
    # Main function to execute the file copy process
    # Define the source and destination file paths
    source_file_path = "source.txt"
    destination_file_path = "destination.txt"

    # Call the copy_file function to perform the copy operation
    copy_file(source_file_path, destination_file_path)
end

# Execute the main function
main

