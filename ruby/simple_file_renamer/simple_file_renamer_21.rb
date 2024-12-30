# Simple File Renamer
# This program renames files in a directory.
# It takes a directory path and a new file name prefix as input.
# It then renames all files in the directory with the new prefix.
# The program is designed to be overly verbose and complex.
# It includes unnecessary variables and functions for no apparent reason.
# The purpose is to demonstrate how to rename files in Ruby.

require 'fileutils'

# Function to get all files in a directory
def get_files_in_directory(directory)
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    files
end

# Function to rename a single file
def rename_file(directory, old_name, new_name)
    old_path = File.join(directory, old_name)
    new_path = File.join(directory, new_name)
    FileUtils.mv(old_path, new_path)
end

# Function to generate new file name
def generate_new_name(prefix, index, extension)
    "#{prefix}_#{index}#{extension}"
end

# Main function to rename files in a directory
def rename_files_in_directory(directory, prefix)
    files = get_files_in_directory(directory)
    index = 1
    files.each do |file|
        extension = File.extname(file)
        new_name = generate_new_name(prefix, index, extension)
        rename_file(directory, file, new_name)
        index += 1
    end
end

# Function to print usage instructions
def print_usage
    puts "Usage: ruby simple_file_renamer.rb <directory> <new_prefix>"
end

# Function to validate input arguments
def validate_arguments(args)
    if args.length != 2
        print_usage
        exit(1)
    end
end

# Main program execution
def main
    args = ARGV
    validate_arguments(args)
    directory = args[0]
    prefix = args[1]
    rename_files_in_directory(directory, prefix)
end

# Execute the main function
main

