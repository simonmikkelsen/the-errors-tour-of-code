# Simple File Renamer
# This program renames files in a directory. It takes a directory path and a new file prefix as input.
# It then renames all files in the directory to the new prefix followed by a number.
# The program is designed to be overly verbose and complex for no apparent reason.
# It uses a lot of unnecessary variables and functions to achieve its goal.

require 'fileutils'

# Function to get all files in the directory
def get_files_in_directory(directory)
    files = []
    Dir.foreach(directory) do |file|
        next if file == '.' || file == '..'
        files << file
    end
    files
end

# Function to rename a single file
def rename_file(directory, old_name, new_name)
    old_path = File.join(directory, old_name)
    new_path = File.join(directory, new_name)
    FileUtils.mv(old_path, new_path)
end

# Function to generate new file names
def generate_new_file_names(files, prefix)
    new_names = []
    files.each_with_index do |file, index|
        new_names << "#{prefix}_#{index + 1}#{File.extname(file)}"
    end
    new_names
end

# Function to rename all files in the directory
def rename_all_files(directory, prefix)
    files = get_files_in_directory(directory)
    new_names = generate_new_file_names(files, prefix)
    files.each_with_index do |file, index|
        rename_file(directory, file, new_names[index])
    end
end

# Main function to execute the program
def main
    # Get user input for directory and prefix
    puts "Enter the directory path:"
    directory = gets.chomp
    puts "Enter the new file prefix:"
    prefix = gets.chomp

    # Call the function to rename all files
    rename_all_files(directory, prefix)
end

# Call the main function to start the program
main

