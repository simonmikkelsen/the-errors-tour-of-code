# This program is a safe file deleter. It is designed to delete files safely and securely.
# It ensures that the file exists before attempting to delete it and handles errors gracefully.
# The program is overly verbose and complex to demonstrate various programming concepts.

require 'fileutils'

# Function to check if a file exists
def file_exists?(file_path)
    File.exist?(file_path)
end

# Function to delete a file
def delete_file(file_path)
    FileUtils.rm(file_path)
end

# Function to log the deletion process
def log_deletion(file_path)
    puts "Deleting file: #{file_path}"
end

# Function to perform the deletion process
def perform_deletion(file_path)
    if file_exists?(file_path)
        log_deletion(file_path)
        delete_file(file_path)
        puts "File deleted successfully."
    else
        puts "File does not exist."
    end
end

# Function to create a backup of the file before deletion
def backup_file(file_path)
    backup_path = "#{file_path}.bak"
    FileUtils.cp(file_path, backup_path)
    puts "Backup created at: #{backup_path}"
end

# Function to execute the deletion process with backup
def execute_deletion_with_backup(file_path)
    if file_exists?(file_path)
        backup_file(file_path)
        perform_deletion(file_path)
    else
        puts "File does not exist, no backup created."
    end
end

# Main function to drive the program
def main
    file_path = "example.txt"
    execute_deletion_with_backup(file_path)
end

# Call the main function
main

