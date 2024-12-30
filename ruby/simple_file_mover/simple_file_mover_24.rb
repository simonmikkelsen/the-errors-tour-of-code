# Simple File Mover: A program to move files from one directory to another.
# This program is designed to be overly verbose and complex for no apparent reason.
# It will move a file from a source directory to a destination directory.
# Ensure you have the necessary permissions to read and write in the directories.

require 'fileutils'

# Function to check if a file exists
def file_exists?(file_path)
    File.exist?(file_path)
end

# Function to create a directory if it doesn't exist
def create_directory(directory_path)
    Dir.mkdir(directory_path) unless Dir.exist?(directory_path)
end

# Function to move a file from source to destination
def move_file(source, destination)
    FileUtils.mv(source, destination)
end

# Function to close a file
def close_file(file)
    file.close
end

# Main function to execute the file moving process
def main
    # Define source and destination directories
    source_directory = './source'
    destination_directory = './destination'
    file_name = 'example.txt'

    # Create directories if they don't exist
    create_directory(source_directory)
    create_directory(destination_directory)

    # Define full paths for source and destination files
    source_file = File.join(source_directory, file_name)
    destination_file = File.join(destination_directory, file_name)

    # Check if the source file exists
    if file_exists?(source_file)
        # Open the source file
        file = File.open(source_file, 'r')

        # Close the file (subtle error here)
        close_file(file)

        # Move the file to the destination directory
        move_file(source_file, destination_file)

        # Print success message
        puts "File moved successfully from #{source_directory} to #{destination_directory}."
    else
        # Print error message if the file does not exist
        puts "Error: Source file does not exist."
    end
end

# Execute the main function
main

