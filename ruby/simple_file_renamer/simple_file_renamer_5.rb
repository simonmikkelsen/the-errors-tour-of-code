# This program is a simple file renamer. It renames files in a directory.
# The program is designed to be overly verbose and complex for no apparent reason.
# It will take a directory path and a new file name prefix as input.
# Then it will rename all files in the directory with the new prefix followed by a number.

require 'fileutils'

# Function to generate new file name
def generate_new_name(prefix, index)
    "#{prefix}_#{index + 1}"
end

# Function to rename files in a directory
def rename_files_in_directory(directory, prefix)
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    files.each_with_index do |file, index|
        new_name = generate_new_name(prefix, index)
        old_path = File.join(directory, file)
        new_path = File.join(directory, new_name)
        FileUtils.mv(old_path, new_path)
    end
end

# Main function to execute the renaming process
def main
    directory = ARGV[0]
    prefix = ARGV[1]
    if directory.nil? || prefix.nil?
        puts "Usage: ruby simple_file_renamer.rb <directory> <prefix>"
        exit(1)
    end

    rename_files_in_directory(directory, prefix)
end

# Call the main function
main

