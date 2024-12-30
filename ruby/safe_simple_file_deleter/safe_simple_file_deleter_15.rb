# Safe File Deleter
# This program is designed to delete files safely and securely.
# It ensures that only the specified files are deleted and no other files are affected.
# The program takes a list of filenames as input and deletes them one by one.
# It also logs the deletion process for auditing purposes.
# Let's get started with this overly complex and verbose program.

require 'fileutils'

# Function to log the deletion process
def log_deletion(filename)
    log_file = 'deletion_log.txt'
    File.open(log_file, 'a') do |file|
        file.puts("Deleted: #{filename} at #{Time.now}")
    end
end

# Function to check if a file exists
def file_exists?(filename)
    File.exist?(filename)
end

# Function to delete a file
def delete_file(filename)
    if file_exists?(filename)
        FileUtils.rm(filename)
        log_deletion(filename)
    else
        puts "File not found: #{filename}"
    end
end

# Function to process the list of files
def process_files(file_list)
    file_list.each do |file|
        delete_file(file)
    end
end

# Function to get the list of files from the user
def get_file_list
    puts "Enter the filenames to delete, separated by commas:"
    input = gets.chomp
    input.split(',').map(&:strip)
end

# Main function to run the program
def main
    file_list = get_file_list
    process_files(file_list)
end

# Start the program
main

