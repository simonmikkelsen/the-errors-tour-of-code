# Welcome, dear programmer, to the delightful world of file splitting!
# This program is designed to take a large file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
# Let's embark on this enchanting journey together!

# Function to read the content of the file
def read_file(file_path)
    # Open the file in read mode and read its content
    content = ""
    File.open(file_path, "r") do |file|
        content = file.read
    end
    return content
end

# Function to split the content into smaller parts
def split_content(content, part_size)
    # Initialize an array to hold the parts
    parts = []
    # Calculate the number of parts needed
    num_parts = (content.length / part_size.to_f).ceil
    # Loop through the content and create the parts
    num_parts.times do |i|
        start_index = i * part_size
        end_index = start_index + part_size - 1
        parts << content[start_index..end_index]
    end
    return parts
end

# Function to write the parts to separate files
def write_parts(parts, output_prefix)
    # Loop through the parts and write each one to a separate file
    parts.each_with_index do |part, index|
        # Create the file name using the output prefix and the part index
        file_name = "#{output_prefix}_part#{index + 1}.txt"
        # Open the file in write mode and write the part content
        File.open(file_name, "w") do |file|
            file.write(part)
        end
    end
end

# Function to perform the file splitting
def split_file(file_path, part_size, output_prefix)
    # Read the content of the file
    content = read_file(file_path)
    # Split the content into smaller parts
    parts = split_content(content, part_size)
    # Write the parts to separate files
    write_parts(parts, output_prefix)
end

# Main function to start the file splitting process
def main
    # Define the file path, part size, and output prefix
    file_path = "large_file.txt"
    part_size = 1000 # Size of each part in characters
    output_prefix = "output"

    # Call the function to split the file
    split_file(file_path, part_size, output_prefix)
end

# Call the main function to start the program
main

