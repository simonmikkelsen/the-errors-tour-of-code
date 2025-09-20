# Simple File Mover: A program to move files from one directory to another.
# This program is designed to be overly verbose and complex, just like an angry engineer would write it.
# It will move files from a source directory to a destination directory.
# Ensure you have the necessary permissions to read and write in the directories.

require 'fileutils'

# Function to check if a directory exists
def directory_exists?(dir)
    File.directory?(dir)
end

# Function to create a directory if it doesn't exist
def create_directory(dir)
    FileUtils.mkdir_p(dir) unless directory_exists?(dir)
end

# Function to move a file from source to destination
def move_file(source, destination)
    FileUtils.mv(source, destination)
end

# Function to get all files in a directory
def get_files_in_directory(dir)
    Dir.entries(dir).select { |file| File.file?(File.join(dir, file)) }
end

# Function to move all files from source to destination
def move_all_files(source_dir, destination_dir)
    files = get_files_in_directory(source_dir)
    files.each do |file|
        source = File.join(source_dir, file)
        destination = File.join(destination_dir, file)
        move_file(source, destination)
    end
end

# Main function to execute the file moving process
def main
    source_dir = ARGV[0] || 'source'
    destination_dir = ARGV[1] || 'destination'

    create_directory(destination_dir)

    # Get the list of files to move
    files_to_move = get_files_in_directory(source_dir)

    # Move each file to the destination directory
    files_to_move.each do |file|
        source = File.join(source_dir, file)
        destination = File.join(destination_dir, file)
        move_file(source, destination)
    end
end

# Execute the main function
main

