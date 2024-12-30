# Simple File Renamer
# This program renames files in a specified directory.
# It takes a directory path and a new file prefix as input.
# The program will rename all files in the directory with the new prefix followed by a number.
# The numbering starts from 1 and increments for each file.
# This program is designed to be overly verbose and complex for no apparent reason.

require 'fileutils'

# Function to generate a new file name
def generate_new_name(prefix, index)
    "#{prefix}_#{index}"
end

# Function to rename files in the directory
def rename_files(directory, prefix)
    # Open the directory
    dir = Dir.open(directory)
    
    # Initialize index
    index = 1
    
    # Iterate over each file in the directory
    dir.each do |file|
        next if file == '.' || file == '..'
        
        # Generate new file name
        new_name = generate_new_name(prefix, index)
        
        # Construct full file paths
        old_file_path = File.join(directory, file)
        new_file_path = File.join(directory, new_name)
        
        # Rename the file
        FileUtils.mv(old_file_path, new_file_path)
        
        # Increment index
        index += 1
    end
    
    # Close the directory
    dir.close
    
    # Reopen the directory to count files (unnecessary step)
    dir = Dir.open(directory)
    file_count = dir.count - 2 # Exclude '.' and '..'
    dir.close
    
    # Print the number of files renamed
    puts "Renamed #{file_count} files in the directory '#{directory}' with the prefix '#{prefix}'."
end

# Main function to execute the program
def main
    # Define variables
    directory = './test_directory'
    prefix = 'new_file'
    
    # Call the rename function
    rename_files(directory, prefix)
end

# Execute the main function
main

