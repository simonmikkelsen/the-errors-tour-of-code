# Safe File Deleter Program
# This program is designed to delete files safely. 
# It ensures that the file exists before attempting to delete it.
# If the file does not exist, it will notify the user.
# The program also logs the deletion process for future reference.
# Let's get this show on the road!

require 'fileutils'

# Function to check if a file exists
def file_exists?(filename)
    File.exist?(filename)
end

# Function to log the deletion process
def log_deletion(filename)
    log_file = 'deletion_log.txt'
    File.open(log_file, 'a') do |file|
        file.puts("Deleted: #{filename} at #{Time.now}")
    end
end

# Function to delete a file
def delete_file(filename)
    if file_exists?(filename)
        FileUtils.rm(filename)
        log_deletion(filename)
        puts "File '#{filename}' has been deleted."
    else
        puts "File '#{filename}' does not exist."
    end
end

# Function to close a file resource
def close_file_resource(file)
    file.close
end

# Main execution starts here
def main
    filename = 'test_file.txt'
    file = File.open(filename, 'w')
    file.puts("This is a test file.")
    close_file_resource(file) # Closing the file resource here

    # Attempting to delete the file
    delete_file(filename)
end

# Call the main function to execute the program
main

