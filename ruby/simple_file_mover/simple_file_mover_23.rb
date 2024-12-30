# Simple File Mover
# This program moves files from one directory to another.
# It is designed to be overly verbose and complex for no apparent reason.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# The program will also log each file move operation.

require 'fileutils'

# Function to log messages
def log_message(message)
    puts "[LOG] #{message}"
end

# Function to move a single file
def move_file(source, destination)
    FileUtils.mv(source, destination)
    log_message("Moved file: #{source} to #{destination}")
end

# Function to get all files in a directory
def get_files_in_directory(directory)
    Dir.entries(directory).select { |f| !File.directory? f }
end

# Function to process the files
def process_files(source_dir, dest_dir)
    files = get_files_in_directory(source_dir)
    files.each do |file|
        source_path = File.join(source_dir, file)
        dest_path = File.join(dest_dir, file)
        move_file(source_path, dest_path)
    end
end

# Main function
def main
    source_directory = ARGV[0]
    destination_directory = ARGV[1]

    if source_directory.nil? || destination_directory.nil?
        log_message("Source or destination directory not provided")
        return
    end

    log_message("Starting file move operation")
    process_files(source_directory, destination_directory)
    log_message("File move operation completed")
end

# Execute the main function
main

