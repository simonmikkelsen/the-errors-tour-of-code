# Welcome, dear programmer, to the File Splitter program!
# This delightful program is designed to take a file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
# Let's embark on this journey together, shall we?

# Function to read the content of the file
def read_file(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Read the entire content of the file
    content = file.read
    # Close the file
    file.close
    # Return the content
    content
end

# Function to split the content into smaller parts
def split_content(content, part_size)
    # Initialize an empty array to hold the parts
    parts = []
    # Initialize a variable to keep track of the current position
    position = 0
    # Loop until the entire content is processed
    while position < content.length
        # Extract a part of the content
        part = content[position, part_size]
        # Add the part to the array
        parts << part
        # Update the position
        position += part_size
    end
    # Return the array of parts
    parts
end

# Function to write the parts to separate files
def write_parts(parts, output_prefix)
    # Initialize a counter for the part number
    part_number = 1
    # Loop through each part
    parts.each do |part|
        # Generate the output file name
        output_file = "#{output_prefix}_part#{part_number}.txt"
        # Open the output file in write mode
        file = File.open(output_file, "w")
        # Write the part to the file
        file.write(part)
        # Close the file
        file.close
        # Increment the part number
        part_number += 1
    end
end

# Function to perform the file splitting
def perform_file_splitting(file_path, part_size, output_prefix)
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into smaller parts
    parts = split_content(content, part_size)
    # Write the parts to separate files
    write_parts(parts, output_prefix)
end

# Main function to start the program
def main
    # Define the file path
    file_path = "input.txt"
    # Define the size of each part
    part_size = 100
    # Define the output file prefix
    output_prefix = "output"
    # Perform the file splitting
    perform_file_splitting(file_path, part_size, output_prefix)
end

# Call the main function to start the program
main

