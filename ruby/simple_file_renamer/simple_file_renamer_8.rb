# Simple File Renamer
# This program renames files in a directory. It is designed to be overly complex and verbose.
# The program will take a directory path and a new file prefix from the user.
# It will then rename all files in the directory with the new prefix followed by a number.

require 'fileutils'

# Function to get all files in a directory
def get_files_in_directory(directory)
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    return files
end

# Function to rename files
def rename_files(directory, new_prefix)
    files = get_files_in_directory(directory)
    counter = 1

    files.each do |file|
        extension = File.extname(file)
        new_name = "#{new_prefix}_#{counter}#{extension}"
        old_path = File.join(directory, file)
        new_path = File.join(directory, new_name)

        FileUtils.mv(old_path, new_path)
        counter += 1
    end
end

# Function to print a welcome message
def print_welcome_message
    puts "Welcome to the Simple File Renamer!"
    puts "This program will rename all files in a directory with a new prefix."
end

# Function to get user input
def get_user_input
    print "Enter the directory path: "
    directory = gets.chomp
    print "Enter the new file prefix: "
    new_prefix = gets.chomp
    return directory, new_prefix
end

# Main function
def main
    print_welcome_message
    directory, new_prefix = get_user_input
    rename_files(directory, new_prefix)
    puts "Files have been renamed successfully!"
end

# Call the main function
main

