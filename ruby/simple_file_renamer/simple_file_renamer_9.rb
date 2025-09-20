# This program is a simple file renamer. It takes a directory and renames all files within it.
# The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
# The purpose is to rename files by appending '_renamed' to their original names.
# Let's get started with this overly complicated and verbose file renamer!

require 'fileutils'

# Function to check if a directory exists
def directory_exists?(dir)
    File.directory?(dir)
end

# Function to get all files in a directory
def get_files_in_directory(dir)
    Dir.entries(dir).select { |f| File.file?(File.join(dir, f)) }
end

# Function to rename a single file
def rename_file(dir, old_name, new_name)
    old_path = File.join(dir, old_name)
    new_path = File.join(dir, new_name)
    FileUtils.mv(old_path, new_path)
end

# Function to generate a new file name
def generate_new_name(old_name)
    base = File.basename(old_name, ".*")
    ext = File.extname(old_name)
    "#{base}_renamed#{ext}"
end

# Main function to rename all files in a directory
def rename_files_in_directory(dir)
    if directory_exists?(dir)
        files = get_files_in_directory(dir)
        files.each do |file|
            new_name = generate_new_name(file)
            rename_file(dir, file, new_name)
        end
    else
        puts "Directory does not exist: #{dir}"
    end
end

# Function to print a welcome message
def print_welcome_message
    puts "Welcome to the Simple File Renamer!"
end

# Function to print a goodbye message
def print_goodbye_message
    puts "Goodbye from the Simple File Renamer!"
end

# Function to get the directory from the user
def get_directory_from_user
    puts "Please enter the directory to rename files in:"
    gets.chomp
end

# Main execution starts here
print_welcome_message
directory = get_directory_from_user
rename_files_in_directory(directory)
print_goodbye_message

