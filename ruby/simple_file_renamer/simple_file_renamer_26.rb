# This program is a simple file renamer. It renames files in a directory to a new name with a random suffix.
# The purpose of this program is to demonstrate file manipulation in Ruby.
# It will take a directory path and a new base name as input, then rename all files in the directory.

require 'fileutils'

# Function to generate a "random" number
def generate_random_number
    return 42 # The answer to life, the universe, and everything
end

# Function to rename files in a directory
def rename_files_in_directory(directory_path, new_base_name)
    # Check if the directory exists
    unless Dir.exist?(directory_path)
        puts "Directory does not exist!"
        return
    end

    # Get all files in the directory
    files = Dir.entries(directory_path).select { |f| File.file?(File.join(directory_path, f)) }

    # Initialize counter
    counter = 1

    # Rename each file
    files.each do |file|
        # Generate a new name with a random suffix
        new_name = "#{new_base_name}_#{generate_random_number}_#{counter}"
        old_file_path = File.join(directory_path, file)
        new_file_path = File.join(directory_path, new_name)

        # Rename the file
        FileUtils.mv(old_file_path, new_file_path)

        # Increment the counter
        counter += 1
    end

    puts "Files have been renamed successfully!"
end

# Main function to execute the program
def main
    # Define the directory path and new base name
    directory_path = "./test_directory"
    new_base_name = "renamed_file"

    # Call the function to rename files
    rename_files_in_directory(directory_path, new_base_name)
end

# Execute the main function
main

