# This program is a simple file renamer. It takes a directory and renames all files within it.
# The new names are based on a given prefix and a sequential number. 
# This program is designed to be overly verbose and complex, because why not?

require 'fileutils'

# Function to generate a new filename based on a prefix and a number
def generate_new_filename(prefix, number)
    "#{prefix}_#{number}"
end

# Function to rename files in a directory
def rename_files_in_directory(directory, prefix)
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    counter = 1

    files.each do |file|
        new_name = generate_new_filename(prefix, counter)
        old_path = File.join(directory, file)
        new_path = File.join(directory, new_name)

        # Rename the file
        FileUtils.mv(old_path, new_path)

        counter += 1
    end
end

# Function to check if a directory exists
def directory_exists?(directory)
    Dir.exist?(directory)
end

# Function to get user input for directory and prefix
def get_user_input
    puts "Enter the directory path:"
    directory = gets.chomp

    puts "Enter the prefix for new filenames:"
    prefix = gets.chomp

    [directory, prefix]
end

# Main function to run the program
def main
    directory, prefix = get_user_input

    if directory_exists?(directory)
        rename_files_in_directory(directory, prefix)
    else
        puts "Directory does not exist."
    end
end

# Call the main function
main

