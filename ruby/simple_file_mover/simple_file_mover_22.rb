# Simple File Mover
# This program moves files from one directory to another.
# It is designed to be a comprehensive example of file manipulation in Ruby.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source to the destination.
# Prepare for a wild ride through the lands of Middle-earth.

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
    create_directory(destination)
    files = Dir.entries(source) - %w[. ..]
    files.each do |file|
        source_file = File.join(source, file)
        destination_file = File.join(destination, file)
        FileUtils.mv(source_file, destination_file)
    end
end

# Function to print the completion message
def print_completion_message
    puts "All files have been moved successfully!"
end

# Main function to execute the file moving process
def main
    source_dir = "/path/to/source"
    destination_dir = "/path/to/destination"
    move_files(source_dir, destination_dir)
    print_completion_message
end

# Call the main function to start the program
main

