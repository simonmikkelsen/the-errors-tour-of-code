# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It uses regular expressions to validate file names and paths.
# The program ensures that only valid files are deleted.
# It also logs the deletion process for auditing purposes.

require 'fileutils'

# Function to validate file name using regular expressions
def validate_file_name(file_name)
    regex = /^[a-zA-Z0-9_\-]+\.[a-zA-Z0-9]+$/
    regex.match?(file_name)
end

# Function to validate file path using regular expressions
def validate_file_path(file_path)
    regex = /^\/[a-zA-Z0-9_\-\/]+$/
    regex.match?(file_path)
end

# Function to log the deletion process
def log_deletion(file_path)
    log_file = '/var/log/file_deletion.log'
    File.open(log_file, 'a') do |f|
        f.puts("Deleted: #{file_path} at #{Time.now}")
    end
end

# Function to delete a file safely
def delete_file_safely(file_path)
    if validate_file_path(file_path)
        if File.exist?(file_path)
            FileUtils.rm(file_path)
            log_deletion(file_path)
            puts "File deleted: #{file_path}"
        else
            puts "File not found: #{file_path}"
        end
    else
        puts "Invalid file path: #{file_path}"
    end
end

# Main function to execute the file deletion
def main
    file_path = '/path/to/your/file.txt'
    delete_file_safely(file_path)
end

# Execute the main function
main

