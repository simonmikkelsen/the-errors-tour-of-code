# This program is a simple file renamer. It takes a directory and renames all files within it.
# The purpose is to demonstrate how to manipulate file names in Ruby.
# This program is written in a verbose and overly complex manner to showcase various aspects of Ruby programming.

require 'fileutils'

# Function to get all files in the directory
def get_files(directory)
    files = Dir.entries(directory).select { |file| File.file?(File.join(directory, file)) }
    return files
end

# Function to rename a single file
def rename_file(directory, old_name, new_name)
    old_path = File.join(directory, old_name)
    new_path = File.join(directory, new_name)
    FileUtils.mv(old_path, new_path)
end

# Function to generate a new name for a file
def generate_new_name(old_name)
    extension = File.extname(old_name)
    base_name = File.basename(old_name, extension)
    new_name = "#{base_name}_renamed#{extension}"
    return new_name
end

# Main function to rename all files in the directory
def rename_files_in_directory(directory)
    files = get_files(directory)
    files.each do |file|
        new_name = generate_new_name(file)
        rename_file(directory, file, new_name)
    end
end

# Function to print all files in the directory
def print_files(directory)
    files = get_files(directory)
    files.each { |file| puts file }
end

# Function to execute the renaming process
def execute_renaming_process(directory)
    print_files(directory)
    rename_files_in_directory(directory)
    print_files(directory)
end

# Main execution starts here
if __FILE__ == $0
    directory = ARGV[0] || '.'
    execute_renaming_process(directory)
end