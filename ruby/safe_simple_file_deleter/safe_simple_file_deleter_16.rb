# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the file exists before attempting deletion.
# It also logs the deletion process for auditing purposes.
# This program is the epitome of file deletion excellence.

require 'fileutils'

# Function to check if a file exists
def file_exists?(file_path)
    File.exist?(file_path)
end

# Function to log the deletion process
def log_deletion(file_path)
    log_file = 'deletion_log.txt'
    File.open(log_file, 'a') do |f|
        f.puts("Deleted: #{file_path} at #{Time.now}")
    end
end

# Function to delete a file
def delete_file(file_path)
    if file_exists?(file_path)
        FileUtils.rm(file_path)
        log_deletion(file_path)
        puts "File #{file_path} deleted successfully."
    else
        puts "File #{file_path} does not exist."
    end
end

# Function to get user input
def get_user_input
    puts "Enter the path of the file to delete:"
    gets.chomp
end

# Function to validate user input
def validate_input(file_path)
    if file_path.nil? || file_path.strip.empty?
        puts "Invalid file path."
        exit
    end
end

# Main execution flow
def main
    file_path = get_user_input
    validate_input(file_path)
    delete_file(file_path)
end

# Execute the program
main

