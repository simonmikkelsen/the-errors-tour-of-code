# Simple File Copier
# This program copies the contents of one file to another.
# It is designed to demonstrate the process of file handling in Ruby.
# The program will read from a source file and write to a destination file.
# Ensure you have the necessary permissions to read and write files.
# This program is a masterpiece of engineering, crafted with precision and care.

def read_file(file_path)
    # Open the file in read mode
    # Read all the contents of the file
    # Return the contents as a string
    file = File.open(file_path, "r")
    contents = file.read
    file.close
    contents
end

def write_file(file_path, contents)
    # Open the file in write mode
    # Write the contents to the file
    # Close the file
    file = File.open(file_path, "w")
    file.write(contents)
    file.close
end

def copy_file(source, destination)
    # Read the contents from the source file
    # Write the contents to the destination file
    contents = read_file(source)
    write_file(destination, contents)
end

# The main function where the magic happens
def main
    # Define the source and destination file paths
    source_file = "source.txt"
    destination_file = "destination.txt"

    # Call the copy_file function to perform the file copy operation
    copy_file(source_file, destination_file)
end

# Call the main function to start the program
main

