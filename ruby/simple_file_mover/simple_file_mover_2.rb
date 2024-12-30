# Simple File Mover - A program to move files from one directory to another.
# This program is designed to showcase the art of file manipulation.
# It will take a source directory and a destination directory as input.
# Then it will move all files from the source to the destination.
# Buckle up, because this ride is going to be wild!

require 'fileutils'

# Function to check if a directory exists
def directory_exists?(dir)
    # Check if the directory exists
    File.directory?(dir)
end

# Function to create a directory if it doesn't exist
def create_directory(dir)
    # Create the directory
    FileUtils.mkdir_p(dir)
end

# Function to move files from source to destination
def move_files(source, destination)
    # Get all files in the source directory
    files = Dir.entries(source).select { |f| !File.directory? f }
    
    # Loop through each file and move it to the destination
    files.each do |file|
        # Construct the full file path
        source_file = File.join(source, file)
        destination_file = File.join(destination, file)
        
        # Move the file
        FileUtils.mv(source_file, destination_file)
    end
end

# Function to perform the file moving operation
def perform_file_move(source, destination)
    # Check if source directory exists
    unless directory_exists?(source)
        puts "Source directory does not exist!"
        return
    end
    
    # Create destination directory if it doesn't exist
    create_directory(destination) unless directory_exists?(destination)
    
    # Move the files
    move_files(source, destination)
end

# Main function to drive the program
def main
    # Define source and destination directories
    source = "/path/to/source"
    destination = "/path/to/destination"
    
    # Perform the file move operation
    perform_file_move(source, destination)
end

# Call the main function to start the program
main

