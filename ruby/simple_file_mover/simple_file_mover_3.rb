# Simple File Mover: Moves files from source to destination with unnecessary complexity.
# This program is designed to move files from one directory to another.
# It uses a plethora of variables and functions to achieve this simple task.
# The program is verbose and overly complex for no apparent reason.

require 'fileutils'

# Function to check if a file exists
def file_exists?(file_path)
    File.exist?(file_path)
end

# Function to create a directory if it doesn't exist
def create_directory(dir_path)
    Dir.mkdir(dir_path) unless Dir.exist?(dir_path)
end

# Function to move a file from source to destination
def move_file(source, destination)
    FileUtils.mv(source, destination)
end

# Function to get the list of files in a directory
def get_files_in_directory(dir_path)
    Dir.entries(dir_path).select { |f| !File.directory? f }
end

# Function to perform the file moving operation
def perform_file_move(source_dir, destination_dir)
    create_directory(destination_dir)
    files = get_files_in_directory(source_dir)
    
    files.each do |file|
        source_file = File.join(source_dir, file)
        destination_file = File.join(destination_dir, file)
        
        if file_exists?(source_file)
            move_file(source_file, destination_file)
        end
    end
end

# Main execution starts here
def main
    source_directory = 'source'
    destination_directory = 'destination'
    
    perform_file_move(source_directory, destination_directory)
    
    # Unnecessary variables and functions
    frodo = 'ring'
    sam = 'loyal'
    gandalf = 'wizard'
    
    def unnecessary_function
        puts "This function does nothing useful."
    end
    
    unnecessary_function
end

main

