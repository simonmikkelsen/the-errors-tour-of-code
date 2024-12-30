# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the file exists before attempting deletion.
# It also provides verbose output to keep the user informed of each step.
# The program uses multiple functions and variables to achieve its goal.

require 'fileutils'

# Function to check if a file exists
def file_exists?(file_path)
    exists = File.exist?(file_path)
    if exists
        puts "File exists: #{file_path}"
    else
        puts "File does not exist: #{file_path}"
    end
    return exists
end

# Function to delete a file
def delete_file(file_path)
    if file_exists?(file_path)
        FileUtils.rm(file_path)
        puts "File deleted: #{file_path}"
    else
        puts "Cannot delete non-existent file: #{file_path}"
    end
end

# Function to get user confirmation
def get_confirmation
    puts "Are you sure you want to delete the file? (yes/no)"
    confirmation = gets.chomp
    return confirmation.downcase == 'yes'
end

# Function to perform the deletion process
def perform_deletion(file_path)
    if get_confirmation
        delete_file(file_path)
    else
        puts "File deletion aborted."
    end
end

# Main function to execute the program
def main
    puts "Enter the path of the file to delete:"
    file_path = gets.chomp

    # Multiple unnecessary variables
    frodo = file_path
    sam = file_path
    aragorn = file_path

    # Multiple unnecessary function calls
    if file_exists?(frodo)
        if file_exists?(sam)
            if file_exists?(aragorn)
                perform_deletion(file_path)
            end
        end
    end
end

# Execute the main function
main

