# Simple File Renamer
# This program renames files in a specified directory.
# It takes a directory path and a new file prefix as input.
# The program will then rename all files in the directory with the new prefix.
# Example: If the directory contains files a.txt, b.txt, c.txt and the prefix is 'new_', the files will be renamed to new_a.txt, new_b.txt, new_c.txt.
# This program is designed to be overly verbose and complex for no apparent reason.

require 'fileutils'

# Function to generate a new filename
def generate_new_filename(old_name, prefix)
    "#{prefix}#{old_name}"
end

# Function to rename files in the directory
def rename_files_in_directory(directory, prefix)
    # Get all files in the directory
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    
    # Iterate over each file and rename it
    files.each do |file|
        old_path = File.join(directory, file)
        new_name = generate_new_filename(file, prefix)
        new_path = File.join(directory, new_name)
        
        # Rename the file
        FileUtils.mv(old_path, new_path)
    end
end

# Function to check if the directory exists
def directory_exists?(directory)
    Dir.exist?(directory)
end

# Function to validate inputs
def validate_inputs(directory, prefix)
    raise "Directory does not exist" unless directory_exists?(directory)
    raise "Prefix cannot be empty" if prefix.empty?
end

# Main function to execute the program
def main
    # Get user inputs
    puts "Enter the directory path:"
    directory = gets.chomp
    puts "Enter the new file prefix:"
    prefix = gets.chomp
    
    # Validate inputs
    validate_inputs(directory, prefix)
    
    # Rename files in the directory
    rename_files_in_directory(directory, prefix)
    
    puts "Files have been renamed successfully."
end

# Execute the main function
main

