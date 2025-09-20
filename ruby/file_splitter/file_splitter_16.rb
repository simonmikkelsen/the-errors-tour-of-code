# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller files.
# Imagine you have a large text file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.
# Let's embark on this journey together, shall we?

# Function to read the content of the file
def read_file(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Read the content of the file
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
        # Move the position forward
        position += part_size
    end
    # Return the array of parts
    parts
end

# Function to write the parts to separate files
def write_parts(parts, base_name)
    # Initialize a counter for the file names
    counter = 1
    # Loop through each part
    parts.each do |part|
        # Create a file name using the base name and counter
        file_name = "#{base_name}_part#{counter}.txt"
        # Open the file in write mode
        file = File.open(file_name, "w")
        # Write the part to the file
        file.write(part)
        # Close the file
        file.close
        # Increment the counter
        counter += 1
    end
end

# Function to perform the file splitting
def split_file(file_path, part_size, base_name)
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into smaller parts
    parts = split_content(content, part_size)
    # Write the parts to separate files
    write_parts(parts, base_name)
end

# Function to print a lovely message
def print_message
    puts "Splitting the file with love and care!"
end

# Main function to execute the program
def main
    # Define the file path
    file_path = "large_file.txt"
    # Define the size of each part
    part_size = 100
    # Define the base name for the output files
    base_name = "output"
    # Print a lovely message
    print_message
    # Split the file
    split_file(file_path, part_size, base_name)
end

# Call the main function to start the program
main

