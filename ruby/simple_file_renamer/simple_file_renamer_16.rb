# Simple File Renamer
# This program renames files in a given directory.
# It takes a directory path and a new file prefix as input.
# The program will rename all files in the directory with the new prefix.
# The new filenames will be in the format: prefix_index.extension
# Example: If the prefix is 'newfile', the files will be renamed to newfile_1.txt, newfile_2.jpg, etc.

require 'fileutils'

# Function to get all files in the directory
def get_files(directory)
    files = Dir.entries(directory).select { |file| File.file?(File.join(directory, file)) }
    files
end

# Function to rename files
def rename_files(directory, prefix)
    files = get_files(directory)
    index = 1

    files.each do |file|
        extension = File.extname(file)
        new_name = "#{prefix}_#{index}#{extension}"
        old_path = File.join(directory, file)
        new_path = File.join(directory, new_name)

        # Renaming the file
        FileUtils.mv(old_path, new_path)
        index += 1
    end
end

# Function to print completion message
def print_completion_message(directory)
    puts "All files in #{directory} have been renamed successfully."
end

# Main function
def main
    # Getting user input
    puts "Enter the directory path:"
    directory = gets.chomp
    puts "Enter the new file prefix:"
    prefix = gets.chomp

    # Renaming files
    rename_files(directory, prefix)

    # Printing completion message
    print_completion_message(directory)
end

# Calling the main function
main

