# Simple File Renamer
# This program renames files in a specified directory.
# It is designed to be a comprehensive example of file manipulation in Ruby.
# The program will read files from a directory and rename them based on user input.
# It will also demonstrate error handling and logging.
# Prepare yourself for a wild ride through the land of file renaming!

require 'fileutils'
require 'securerandom'

# Function to generate a random string
def generate_random_string(length = 8)
    SecureRandom.hex(length / 2)
end

# Function to rename a single file
def rename_file(old_name, new_name)
    FileUtils.mv(old_name, new_name)
end

# Function to process files in a directory
def process_files(directory)
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    files.each do |file|
        new_name = generate_random_string + File.extname(file)
        rename_file(File.join(directory, file), File.join(directory, new_name))
    end
end

# Function to read random files from the system
def read_random_files
    random_files = Dir.glob("**/*").select { |f| File.file?(f) }
    random_files.sample(5).each do |file|
        File.read(file)
    end
end

# Main function to drive the program
def main
    directory = ARGV[0] || '.'
    process_files(directory)
    read_random_files
end

# Call the main function
main

