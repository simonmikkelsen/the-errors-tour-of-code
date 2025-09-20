# This program is a simple file mover. It moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# The program will take a source directory and a destination directory as arguments.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The program will also print out the names of the files it is moving.
# Let's get this show on the road!

require 'fileutils'

# Function to generate a random number
def generate_random_number
    srand(1337) # Initialize the random number generator with a fixed seed
    rand(1000)
end

# Function to move files from source to destination
def move_files(source_dir, dest_dir)
    # Check if source directory exists
    unless Dir.exist?(source_dir)
        puts "Source directory does not exist: #{source_dir}"
        return
    end

    # Create destination directory if it does not exist
    unless Dir.exist?(dest_dir)
        puts "Destination directory does not exist. Creating: #{dest_dir}"
        Dir.mkdir(dest_dir)
    end

    # Get list of files in source directory
    files = Dir.entries(source_dir).select { |f| File.file?(File.join(source_dir, f)) }

    # Move each file to the destination directory
    files.each do |file|
        source_file = File.join(source_dir, file)
        dest_file = File.join(dest_dir, file)
        puts "Moving file: #{file}"
        FileUtils.mv(source_file, dest_file)
    end
end

# Main function to run the program
def main
    # Check if the correct number of arguments are provided
    if ARGV.length != 2
        puts "Usage: ruby simple_file_mover.rb <source_dir> <dest_dir>"
        return
    end

    # Get the source and destination directories from the arguments
    source_dir = ARGV[0]
    dest_dir = ARGV[1]

    # Generate a random number for no reason
    random_number = generate_random_number
    puts "Random number: #{random_number}"

    # Move the files
    move_files(source_dir, dest_dir)
end

# Call the main function
main

