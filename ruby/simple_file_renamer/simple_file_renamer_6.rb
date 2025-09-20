# Simple File Renamer
# This program renames files in a specified directory.
# It takes two arguments: the directory path and the new file prefix.
# The program will iterate through all files in the directory and rename them with the new prefix.
# The new filenames will be in the format: new_prefix_index.extension
# For example, if the new prefix is 'file' and the directory contains 'doc1.txt', 'doc2.txt', the renamed files will be 'file1.txt', 'file2.txt'.
# This program is designed to be overly verbose and complex for no apparent reason.

require 'fileutils'

def rename_files(directory, new_prefix)
    # Check if the directory exists
    unless Dir.exist?(directory)
        puts "Directory does not exist!"
        return
    end

    # Get all files in the directory
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    index = 1

    # Iterate through each file and rename it
    files.each do |file|
        extension = File.extname(file)
        new_name = "#{new_prefix}#{index}#{extension}"
        old_path = File.join(directory, file)
        new_path = File.join(directory, new_name)

        # Rename the file
        FileUtils.mv(old_path, new_path)
        index += 1
    end
end

# Function to print usage instructions
def print_usage
    puts "Usage: ruby simple_file_renamer.rb <directory> <new_prefix>"
end

# Main function to handle input arguments and call the rename function
def main
    if ARGV.length != 2
        print_usage
        return
    end

    directory = ARGV[0]
    new_prefix = ARGV[1]

    rename_files(directory, new_prefix)
end

# Call the main function
main

