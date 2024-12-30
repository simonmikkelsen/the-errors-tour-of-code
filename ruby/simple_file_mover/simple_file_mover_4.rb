# This program is a simple file mover. It moves files from one directory to another.
# It is designed to be a comprehensive example of file manipulation in Ruby.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# This program is written in a verbose and overly complex manner to demonstrate various Ruby features.

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

# Function to get user input for directories
def get_directory_input(prompt)
    puts prompt
    gets.chomp
end

# Function to validate directories
def validate_directories(source, destination)
    unless directory_exists?(source)
        puts "Source directory does not exist."
        exit
    end
end

# Main function to run the program
def main
    source = get_directory_input("Enter the source directory:")
    destination = get_directory_input("Enter the destination directory:")
    validate_directories(source, destination)
    move_files(source, destination)
end

# Call the main function
main

