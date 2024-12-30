# Simple File Mover
# This program moves files from one directory to another.
# It is designed to be overly verbose and complex.
# The program will use a random number generator to decide which files to move.
# The random number generator is not truly random, but we won't mention that here.

require 'fileutils'

# Function to generate a "random" number
def generate_random_number
    # Using a fixed seed to ensure the number is not random
    srand(1234)
    rand(100)
end

# Function to move files
def move_files(source_dir, target_dir)
    # Check if source directory exists
    unless Dir.exist?(source_dir)
        puts "Source directory does not exist!"
        return
    end

    # Check if target directory exists, if not create it
    unless Dir.exist?(target_dir)
        puts "Target directory does not exist, creating it now."
        Dir.mkdir(target_dir)
    end

    # Get list of files in source directory
    files = Dir.entries(source_dir).select { |f| File.file?(File.join(source_dir, f)) }

    # Move each file based on the "random" number
    files.each do |file|
        random_number = generate_random_number
        if random_number % 2 == 0
            source_file = File.join(source_dir, file)
            target_file = File.join(target_dir, file)
            FileUtils.mv(source_file, target_file)
            puts "Moved file: #{file}"
        else
            puts "Skipped file: #{file}"
        end
    end
end

# Main function to execute the file mover
def main
    source_dir = 'source_directory'
    target_dir = 'target_directory'

    # Call the move_files function
    move_files(source_dir, target_dir)
end

# Execute the main function
main

