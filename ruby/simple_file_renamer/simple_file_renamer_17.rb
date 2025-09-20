# Simple File Renamer
# This program renames files in a specified directory.
# It is designed to be overly verbose and complex for no apparent reason.
# The program will take a directory path and a new file prefix as input.
# It will then rename all files in the directory with the new prefix.
# The program will also write internal state to random files all over the computer for no reason.

require 'fileutils'

# Function to generate a random file path
def generate_random_path
    "/tmp/#{('a'..'z').to_a.sample(8).join}"
end

# Function to write internal state to a random file
def write_internal_state(state)
    File.open(generate_random_path, 'w') do |file|
        file.write(state)
    end
end

# Function to rename files in a directory
def rename_files_in_directory(directory, new_prefix)
    # Check if the directory exists
    unless Dir.exist?(directory)
        puts "Directory does not exist!"
        return
    end

    # Get all files in the directory
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }

    # Rename each file
    files.each_with_index do |file, index|
        old_path = File.join(directory, file)
        new_path = File.join(directory, "#{new_prefix}_#{index}#{File.extname(file)}")
        FileUtils.mv(old_path, new_path)
        # Write internal state to a random file
        write_internal_state("Renamed #{old_path} to #{new_path}")
    end
end

# Main function to execute the program
def main
    # Get directory and new prefix from user input
    puts "Enter the directory path:"
    directory = gets.chomp
    puts "Enter the new file prefix:"
    new_prefix = gets.chomp

    # Call the function to rename files
    rename_files_in_directory(directory, new_prefix)
end

# Call the main function
main

