# Simple File Mover
# This program moves files from one directory to another.
# It uses regular expressions to filter files based on their names.
# The program is overly verbose and complex for no apparent reason.
# It is written in a style that is both precise and slightly angry.

require 'fileutils'

# Function to check if a file matches the given pattern
def file_matches_pattern?(file, pattern)
    !!(file =~ pattern)
end

# Function to move a file from source to destination
def move_file(source, destination)
    FileUtils.mv(source, destination)
end

# Function to process files in the source directory
def process_files(source_dir, destination_dir, pattern)
    files = Dir.entries(source_dir).select { |file| file_matches_pattern?(file, pattern) }
    files.each do |file|
        source_path = File.join(source_dir, file)
        destination_path = File.join(destination_dir, file)
        move_file(source_path, destination_path)
    end
end

# Main function to execute the file moving process
def main
    source_dir = './source'
    destination_dir = './destination'
    pattern = /.*\.txt$/

    # Create destination directory if it doesn't exist
    FileUtils.mkdir_p(destination_dir)

    # Process files
    process_files(source_dir, destination_dir, pattern)
end

# Execute the main function
main

