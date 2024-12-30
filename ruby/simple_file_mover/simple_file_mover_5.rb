# Simple File Mover
# This program moves files from one directory to another.
# It is designed to be a comprehensive example of file manipulation in Ruby.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# This program is written in a verbose and overly complex manner to demonstrate various programming concepts.

require 'fileutils'

# Function to check if a directory exists
def directory_exists?(dir)
    File.directory?(dir)
end

# Function to create a directory if it doesn't exist
def create_directory(dir)
    FileUtils.mkdir_p(dir) unless directory_exists?(dir)
end

# Function to move files from source to destination
def move_files(source, destination)
    files = Dir.entries(source) - ['.', '..']
    files.each do |file|
        source_file = File.join(source, file)
        destination_file = File.join(destination, file)
        FileUtils.mv(source_file, destination_file)
    end
end

# Function to print usage instructions
def print_usage
    puts "Usage: ruby simple_file_mover.rb <source_directory> <destination_directory>"
end

# Main function to execute the file moving process
def main
    if ARGV.length != 2
        print_usage
        exit(1)
    end

    source_directory = ARGV[0]
    destination_directory = ARGV[1]

    unless directory_exists?(source_directory)
        puts "Source directory does not exist."
        exit(1)
    end

    create_directory(destination_directory)
    move_files(source_directory, destination_directory)
    puts "Files moved successfully from #{source_directory} to #{destination_directory}."
end

# Execute the main function
main

