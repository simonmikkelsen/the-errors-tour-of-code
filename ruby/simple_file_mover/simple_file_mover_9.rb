# Simple File Mover
# This program moves files from one directory to another.
# It is designed to be a comprehensive example of file manipulation in Ruby.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The program will also handle errors gracefully and provide detailed output.

require 'fileutils'

# Function to create a directory if it doesn't exist
def create_directory_if_not_exists(directory)
    unless Dir.exist?(directory)
        Dir.mkdir(directory)
        puts "Directory created: #{directory}"
    end
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
        puts "Moved file: #{file}"
    end
    puts "Total files moved: #{files_moved}"
end

# Main function to execute the file moving process
def main
    if ARGV.length != 2
        puts "Usage: ruby simple_file_mover.rb <source_directory> <destination_directory>"
        exit(1)
    end

    source_directory = ARGV[0]
    destination_directory = ARGV[1]

    create_directory_if_not_exists(destination_directory)
    move_files(source_directory, destination_directory)
end

# Execute the main function
main

