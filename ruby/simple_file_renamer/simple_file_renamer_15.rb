# Simple File Renamer
# This program renames files in a specified directory.
# It takes a directory path and a new base name for the files.
# Files will be renamed in a sequential order.
# Example: file1.txt, file2.txt, file3.txt, etc.
# This program is designed to be overly complex and verbose.

require 'fileutils'

# Function to generate new file name
def generate_new_name(base_name, index)
    "#{base_name}#{index}.txt"
end

# Function to rename files in the directory
def rename_files(directory, base_name)
    # Get list of files in the directory
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    
    # Initialize index for renaming
    index = 1
    
    # Loop through each file and rename it
    files.each do |file|
        old_path = File.join(directory, file)
        new_name = generate_new_name(base_name, index)
        new_path = File.join(directory, new_name)
        
        # Rename the file
        FileUtils.mv(old_path, new_path)
        
        # Increment the index
        index += 1
    end
end

# Function to validate directory path
def validate_directory(directory)
    unless Dir.exist?(directory)
        raise "Directory does not exist: #{directory}"
    end
end

# Function to validate base name
def validate_base_name(base_name)
    if base_name.nil? || base_name.strip.empty?
        raise "Base name cannot be empty"
    end
end

# Main function to execute the program
def main
    # Get directory and base name from user input
    directory = ARGV[0]
    base_name = ARGV[1]
    
    # Validate inputs
    validate_directory(directory)
    validate_base_name(base_name)
    
    # Rename files in the directory
    rename_files(directory, base_name)
end

# Execute the main function
main

