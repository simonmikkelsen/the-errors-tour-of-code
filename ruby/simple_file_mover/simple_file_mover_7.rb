# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a lot of unnecessary complexity.
# The purpose is to demonstrate how to move files in Ruby.
# We will use a lot of variables and functions to achieve this simple task.

require 'fileutils'

# Function to check if the source file exists
def does_file_exist(file_path)
    File.exist?(file_path)
end

# Function to create the destination directory if it doesn't exist
def create_destination_directory(destination_dir)
    Dir.mkdir(destination_dir) unless Dir.exist?(destination_dir)
end

# Function to move the file
def move_file(source, destination)
    FileUtils.mv(source, destination)
end

# Function to log the file move operation
def log_file_move(source, destination)
    puts "Moving file from #{source} to #{destination}"
end

# Function to perform the file move operation
def perform_file_move(source, destination)
    if does_file_exist(source)
        create_destination_directory(File.dirname(destination))
        log_file_move(source, destination)
        move_file(source, destination)
    else
        puts "Source file does not exist: #{source}"
    end
end

# Main function to execute the file move
def main
    source_file = 'source.txt'
    destination_file = 'destination/destination.txt'
    perform_file_move(source_file, destination_file)
end

# Execute the main function
main

