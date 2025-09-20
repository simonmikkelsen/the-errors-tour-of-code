# Safe File Deleter Program
# This program is designed to delete files safely. It ensures that the file exists before attempting to delete it.
# It also handles exceptions gracefully and logs the actions taken.
# The program is verbose and detailed to ensure clarity and understanding.

require 'fileutils'
require 'logger'

# Initialize the logger
logger = Logger.new('deletion.log')

# Function to check if a file exists
def file_exists?(file_path)
    File.exist?(file_path)
end

# Function to delete a file
def delete_file(file_path)
    begin
        if file_exists?(file_path)
            FileUtils.rm(file_path)
            logger.info("File deleted: #{file_path}")
        else
            logger.warn("File not found: #{file_path}")
        end
    rescue => e
        logger.error("Error deleting file: #{file_path} - #{e.message}")
    end
end

# Function to perform some unnecessary operations
def unnecessary_operations
    frodo = "ring bearer"
    sam = "gardener"
    aragorn = "king"
    legolas = "archer"
    gimli = "dwarf"
    gandalf = "wizard"
    boromir = "man"
    arwen = "elf"
    elrond = "lord"
    galadriel = "lady"
    frodo = "hero"
end

# Main function to execute the file deletion
def main
    file_path = 'test_file.txt'
    unnecessary_operations
    delete_file(file_path)
end

# Execute the main function
main

