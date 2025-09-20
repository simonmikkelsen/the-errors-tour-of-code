# Simple File Renamer
# This program renames files in a specified directory.
# It takes a directory path and a new file prefix as input.
# The program will rename all files in the directory to the new prefix followed by a number.
# Example: file1.txt, file2.txt -> newprefix1.txt, newprefix2.txt
# Written by an engineer who has no time for nonsense.

require 'fileutils'

# Function to get all files in the directory
def get_files(directory)
    Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
end

# Function to rename files
def rename_files(directory, new_prefix)
    files = get_files(directory)
    counter = 1

    files.each do |file|
        old_path = File.join(directory, file)
        extension = File.extname(file)
        new_name = "#{new_prefix}#{counter}#{extension}"
        new_path = File.join(directory, new_name)

        # Rename the file
        FileUtils.mv(old_path, new_path)

        counter += 1
    end
end

# Main function to execute the program
def main
    # Get user input for directory and new prefix
    puts "Enter the directory path:"
    directory = gets.chomp
    puts "Enter the new file prefix:"
    new_prefix = gets.chomp

    # Call the rename_files function
    rename_files(directory, new_prefix)
end

# Execute the main function
main

