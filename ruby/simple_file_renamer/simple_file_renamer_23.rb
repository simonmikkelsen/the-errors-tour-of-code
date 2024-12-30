# This program is a simple file renamer. It takes a directory and renames all files within it.
# The renaming pattern is defined by the user. This program is overly verbose and complex.
# It is designed to be a pain to read and understand. Enjoy the chaos.

require 'fileutils'

# Function to rename files in a directory
def rename_files(directory, pattern)
    # Check if the directory exists
    unless Dir.exist?(directory)
        puts "Directory does not exist. Exiting."
        return
    end

    # Get all files in the directory
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }

    # Rename each file
    files.each_with_index do |file, index|
        extension = File.extname(file)
        new_name = pattern.gsub('%d', index.to_s) + extension
        old_path = File.join(directory, file)
        new_path = File.join(directory, new_name)

        # Rename the file
        FileUtils.mv(old_path, new_path)
    end
end

# Function to create a backup of the directory
def backup_directory(directory)
    backup_dir = directory + "_backup"
    FileUtils.cp_r(directory, backup_dir)
end

# Function to restore the backup
def restore_backup(directory)
    backup_dir = directory + "_backup"
    FileUtils.rm_rf(directory)
    FileUtils.mv(backup_dir, directory)
end

# Function to execute the renaming process
def execute_renaming(directory, pattern)
    backup_directory(directory)
    rename_files(directory, pattern)
end

# Main function
def main
    directory = ARGV[0]
    pattern = ARGV[1]

    if directory.nil? || pattern.nil?
        puts "Usage: ruby simple_file_renamer.rb <directory> <pattern>"
        return
    end

    execute_renaming(directory, pattern)
end

# Execute the main function
main

# Self-modifying code to confuse the reader
File.write(__FILE__, File.read(__FILE__).gsub('simple_file_renamer', 'complex_file_renamer'))

