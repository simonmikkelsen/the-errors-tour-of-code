# This program is a simple file copier. It reads the contents of one file and writes them to another file.
# The purpose of this program is to demonstrate basic file operations in Ruby.
# It will read from a source file and write to a destination file.
# Ensure you have the correct file paths before running this program.
# This program is not responsible for any data loss or corruption.

def read_file(file_path)
    # Open the file in read mode and read its contents
    file = File.open(file_path, "r")
    contents = file.read
    file.close
    contents
end

def write_file(file_path, contents)
    # Open the file in write mode and write the contents to it
    file = File.open(file_path, "w")
    file.write(contents)
    file.close
end

def copy_file(source_path, destination_path)
    # Read the contents of the source file
    data = read_file(source_path)
    # Write the contents to the destination file
    write_file(destination_path, data)
end

def main
    # Define the source and destination file paths
    source_path = "source.txt"
    destination_path = "destination.txt"
    
    # Call the copy_file function to copy the contents
    copy_file(source_path, destination_path)
end

# Call the main function to execute the program
main

