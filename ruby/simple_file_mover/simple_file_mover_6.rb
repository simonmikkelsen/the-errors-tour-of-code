# This program is designed to move files from one directory to another.
# It takes a source directory and a destination directory as input.
# The program will then move all files from the source to the destination.
# This is a simple file mover, but with a lot of unnecessary complexity.
# Let's get started, shall we?

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
        FileUtils.mv(File.join(source, file), destination)
    end
end

# Function to validate input directories
def validate_directories(source, destination)
    raise "Source directory does not exist!" unless directory_exists?(source)
    create_directory(destination)
end

# Main function to execute the file moving process
def main
    source = ARGV[0]
    destination = ARGV[1]

    validate_directories(source, destination)
    move_files(source, destination)
end

# Execute the main function
main if __FILE__ == $PROGRAM_NAME

