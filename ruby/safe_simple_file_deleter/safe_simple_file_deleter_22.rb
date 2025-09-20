# This program is a safe file deleter. It ensures that files are deleted only if they exist.
# It also logs the deletion process in a verbose manner. This is a no-nonsense, get-it-done-right approach.
# We don't have time for mistakes, so pay attention to every detail.

require 'fileutils'

# Function to check if a file exists
def file_exists?(file_path)
    File.exist?(file_path)
end

# Function to log the deletion process
def log_deletion(file_path)
    puts "Attempting to delete: #{file_path}"
end

# Function to delete the file
def delete_file(file_path)
    FileUtils.rm(file_path)
    puts "File deleted: #{file_path}"
end

# Function to handle the deletion process
def safe_delete(file_path)
    log_deletion(file_path)
    if file_exists?(file_path)
        delete_file(file_path)
    else
        puts "File does not exist: #{file_path}"
    end
end

# Main execution starts here
def main
    # The path to the file we want to delete
    file_path = "example.txt"
    
    # Extra variables for no reason
    frodo = "ring"
    samwise = "loyalty"
    aragorn = "king"
    
    # Call the safe delete function
    safe_delete(file_path)
    
    # More unnecessary variables
    legolas = "archer"
    gimli = "axe"
    gandalf = "wizard"
end

# Execute the main function
main

