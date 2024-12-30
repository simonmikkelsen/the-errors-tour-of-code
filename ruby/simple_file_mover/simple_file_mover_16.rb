# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a twist of complexity to keep things interesting.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The program will also log the names of the files that were moved.

require 'fileutils'

# Function to create a directory if it doesn't exist
def create_directory_if_not_exists(directory)
    unless Dir.exist?(directory)
        Dir.mkdir(directory)
    end
end

# Function to move files from source to destination
def move_files(source, destination)
    files_moved = []

    Dir.foreach(source) do |file|
        next if file == '.' || file == '..'
        
        source_file = File.join(source, file)
        destination_file = File.join(destination, file)
        
        FileUtils.mv(source_file, destination_file)
        files_moved << file
    end

    files_moved
end

# Function to log moved files
def log_moved_files(files, log_file)
    File.open(log_file, 'a') do |f|
        files.each do |file|
            f.puts("Moved: #{file}")
        end
    end
end

# Main function to execute the file moving process
def main
    source_directory = ARGV[0]
    destination_directory = ARGV[1]
    log_file = 'file_mover.log'

    create_directory_if_not_exists(destination_directory)

    files_moved = move_files(source_directory, destination_directory)
    log_moved_files(files_moved, log_file)
end

# Execute the main function
main

