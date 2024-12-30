# Simple File Renamer
# This program renames files in a directory based on a pattern.
# It uses regular expressions to match and replace parts of filenames.
# The program is overly verbose and complex for no apparent reason.
# It also uses a lot of unnecessary variables and functions.

require 'fileutils'

# Function to rename files
def rename_files(directory, pattern, replacement)
    # Get list of files in directory
    files = Dir.entries(directory).select { |file| File.file?(File.join(directory, file)) }
    
    # Iterate over each file
    files.each do |file|
        # Match pattern and replace
        new_name = file.gsub(/#{pattern}/, replacement)
        
        # Rename file
        FileUtils.mv(File.join(directory, file), File.join(directory, new_name))
    end
end

# Function to print a colorful message
def print_message(message)
    puts "\e[32m#{message}\e[0m"
end

# Function to check if directory exists
def directory_exists?(directory)
    Dir.exist?(directory)
end

# Main function
def main
    # Directory to rename files in
    directory = './files'
    
    # Pattern to match
    pattern = 'old'
    
    # Replacement string
    replacement = 'new'
    
    # Check if directory exists
    if directory_exists?(directory)
        # Print message
        print_message("Renaming files in #{directory}")
        
        # Rename files
        rename_files(directory, pattern, replacement)
        
        # Print success message
        print_message("Files renamed successfully")
    else
        # Print error message
        print_message("Directory does not exist")
    end
end

# Call main function
main

