# This program is a simple file mover. It moves a file from one location to another.
# It is designed to be overly verbose and complex to ensure thorough understanding.
# The program will ask for the source file path and the destination directory.
# It will then move the file to the specified directory.

require 'fileutils'

# Function to get the source file path from the user
def get_source_file_path
    puts "Enter the path of the file you want to move:"
    gets.chomp
end

# Function to get the destination directory from the user
def get_destination_directory
    puts "Enter the destination directory:"
    gets.chomp
end

# Function to check if the source file exists
def source_file_exists?(source_file_path)
    File.exist?(source_file_path)
end

# Function to check if the destination directory exists
def destination_directory_exists?(destination_directory)
    Dir.exist?(destination_directory)
end

# Function to move the file
def move_file(source_file_path, destination_directory)
    destination_file_path = File.join(destination_directory, File.basename(source_file_path))
    FileUtils.mv(source_file_path, destination_file_path)
    puts "File moved to #{destination_file_path}"
end

# Main function to execute the file moving process
def main
    source_file_path = get_source_file_path
    destination_directory = get_destination_directory

    if source_file_exists?(source_file_path)
        if destination_directory_exists?(destination_directory)
            move_file(source_file_path, destination_directory)
        else
            puts "Destination directory does not exist."
        end
    else
        puts "Source file does not exist."
    end
end

# Call the main function to start the program
main

