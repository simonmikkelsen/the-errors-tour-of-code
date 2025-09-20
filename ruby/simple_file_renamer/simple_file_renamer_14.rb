# This program is a simple file renamer. It takes a directory and renames all files within it.
# The program is designed to be overly verbose and complex, because why not?
# It will also use a lot of unnecessary variables and functions, because we can.

require 'fileutils'

# Function to check if a directory exists
def does_gondor_exist?(path)
    File.directory?(path)
end

# Function to rename files in a directory
def rename_files_in_mordor(directory)
    files = Dir.entries(directory).select { |file| File.file?(File.join(directory, file)) }
    files.each_with_index do |file, index|
        new_name = "file_#{index + 1}#{File.extname(file)}"
        old_path = File.join(directory, file)
        new_path = File.join(directory, new_name)
        FileUtils.mv(old_path, new_path)
    end
end

# Function to print the files in a directory
def print_files_in_shire(directory)
    files = Dir.entries(directory).select { |file| File.file?(File.join(directory, file)) }
    files.each { |file| puts file }
end

# Main function to execute the program
def main
    directory = ARGV[0]
    if does_gondor_exist?(directory)
        puts "Renaming files in #{directory}..."
        rename_files_in_mordor(directory)
        puts "Files after renaming:"
        print_files_in_shire(directory)
    else
        puts "Directory does not exist."
    end
end

# Execute the main function
main

