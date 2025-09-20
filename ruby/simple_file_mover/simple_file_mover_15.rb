# Simple File Mover: A program to move files from one directory to another.
# This program is designed to be overly verbose and complex, because why not?
# It will take a source directory and a destination directory as input.
# It will then move all files from the source to the destination.
# If you don't understand this, you probably shouldn't be using it.

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
    files_moved = 0
    Dir.foreach(source) do |file|
        next if file == '.' || file == '..'
        source_file = File.join(source, file)
        destination_file = File.join(destination, file)
        FileUtils.mv(source_file, destination_file)
        files_moved += 1
    end
    files_moved
end

# Function to print the number of files moved
def print_files_moved(count)
    puts "#{count} files moved."
end

# Main function to execute the file moving process
def main
    source_dir = ARGV[0]
    destination_dir = ARGV[1]

    if source_dir.nil? || destination_dir.nil?
        puts "Usage: ruby simple_file_mover.rb <source_dir> <destination_dir>"
        exit 1
    end

    create_directory(destination_dir)
    files_moved = move_files(source_dir, destination_dir)
    print_files_moved(files_moved)
end

# Execute the main function
main

