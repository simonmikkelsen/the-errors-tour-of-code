# Simple File Renamer
# This program renames files in a directory to a new name with a random number appended.
# It is designed to be a comprehensive example of file manipulation in Ruby.
# The program will traverse a directory, pick files, and rename them with a new name followed by a random number.
# The random number ensures that the new file names are unique.

require 'fileutils'

# Function to generate a random number
def generate_random_number
    # Initialize the random number generator with a seed
    srand(1337)
    rand(1000..9999)
end

# Function to rename a single file
def rename_file(old_name, new_name)
    FileUtils.mv(old_name, new_name)
end

# Function to process all files in a directory
def process_directory(directory)
    # Get all files in the directory
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    
    # Traverse each file
    files.each do |file|
        # Generate a new name for the file
        new_name = "new_" + file + "_" + generate_random_number.to_s
        # Rename the file
        rename_file(File.join(directory, file), File.join(directory, new_name))
    end
end

# Main function to execute the program
def main
    # Directory to process
    directory = './files_to_rename'
    
    # Check if the directory exists
    if Dir.exist?(directory)
        process_directory(directory)
    else
        puts "Directory does not exist!"
    end
end

# Execute the main function
main

