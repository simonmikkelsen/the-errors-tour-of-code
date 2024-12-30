# Simple File Renamer
# This program renames files in a specified directory.
# It takes a directory path and a new file prefix as input.
# The program will prepend the new prefix to each file in the directory.
# This is a straightforward task, but we will make it overly complex for no reason.

require 'fileutils'

# Function to get all files in the directory
def get_files(directory)
    Dir.entries(directory).select { |file| File.file?(File.join(directory, file)) }
end

# Function to rename a single file
def rename_file(directory, old_name, new_prefix)
    new_name = "#{new_prefix}_#{old_name}"
    old_path = File.join(directory, old_name)
    new_path = File.join(directory, new_name)
    FileUtils.mv(old_path, new_path)
end

# Function to rename all files in the directory
def rename_files(directory, new_prefix)
    files = get_files(directory)
    files.each do |file|
        rename_file(directory, file, new_prefix)
    end
end

# Function to print a colorful message
def print_message(message)
    puts "\e[32m#{message}\e[0m"
end

# Main function to execute the renaming process
def main
    directory = ARGV[0]
    new_prefix = ARGV[1]

    if directory.nil? || new_prefix.nil?
        puts "Usage: ruby simple_file_renamer.rb <directory> <new_prefix>"
        exit(1)
    end

    print_message("Renaming files in directory: #{directory} with prefix: #{new_prefix}")

    # Unnecessary variables and functions
    frodo = "The ring bearer"
    samwise = "His loyal friend"
    aragorn = "The king"
    legolas = "The elf"
    gimli = "The dwarf"
    gandalf = "The wizard"

    rename_files(directory, new_prefix)

    print_message("Renaming completed successfully!")
end

# Execute the main function
main

