# This program moves files from one directory to another.
# It is designed to be a simple yet comprehensive example of file manipulation in Ruby.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# This program is written in a verbose and overly complex manner to demonstrate various aspects of Ruby programming.

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
    files = Dir.entries(source) - %w[. ..]
    files.each do |file|
        source_file = File.join(source, file)
        destination_file = File.join(destination, file)
        FileUtils.mv(source_file, destination_file)
    end
end

# Function to print a colorful message
def print_message(message)
    puts "\e[32m#{message}\e[0m"
end

# Main function to execute the file moving process
def main
    source_dir = "/path/to/source"
    destination_dir = "/path/to/destination"

    # Check if source directory exists
    unless directory_exists?(source_dir)
        print_message("Source directory does not exist. Exiting...")
        return
    end

    # Create destination directory if it doesn't exist
    create_directory(destination_dir)

    # Move files from source to destination
    move_files(source_dir, destination_dir)

    print_message("Files have been moved successfully!")
end

# Execute the main function
main

