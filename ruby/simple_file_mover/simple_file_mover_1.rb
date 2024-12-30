# This program is designed to move a file from one location to another.
# It will take a source file path and a destination file path as input.
# The program will then proceed to move the file, ensuring that the file
# is successfully relocated to the specified destination.

require 'fileutils'

# Function to check if the source file exists
def does_file_exist(source)
    File.exist?(source)
end

# Function to create a backup of the source file
def create_backup(source, backup)
    FileUtils.cp(source, backup)
end

# Function to move the file from source to destination
def move_file(source, destination)
    FileUtils.mv(source, destination)
end

# Function to delete the backup file
def delete_backup(backup)
    FileUtils.rm(backup)
end

# Function to perform the file move operation
def perform_file_move(source, destination)
    backup = source + '.bak'
    
    if does_file_exist(source)
        create_backup(source, backup)
        move_file(source, destination)
        delete_backup(backup)
    else
        puts "Source file does not exist."
    end
end

# Main function to execute the program
def main
    # Define the source and destination file paths
    source = 'source.txt'
    destination = 'destination.txt'
    
    # Perform the file move operation
    perform_file_move(source, destination)
end

# Execute the main function
main

