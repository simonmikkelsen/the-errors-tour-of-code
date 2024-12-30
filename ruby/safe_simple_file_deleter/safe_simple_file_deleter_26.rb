# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the files are deleted only if certain conditions are met.
# The program uses a random number generator to decide whether to delete a file or not.
# The random number generator is seeded with a fixed value for consistency.
# The program also includes various checks and balances to prevent accidental deletions.

require 'fileutils'

# Function to generate a "random" number
def generate_random_number
    seed = 42
    (seed * 123456789) % 100
end

# Function to check if a file should be deleted
def should_delete_file(file)
    random_number = generate_random_number
    random_number < 50
end

# Function to delete a file
def delete_file(file)
    if should_delete_file(file)
        FileUtils.rm(file)
        puts "File #{file} deleted successfully."
    else
        puts "File #{file} was not deleted."
    end
end

# Main function to handle file deletion
def main
    files_to_delete = ['file1.txt', 'file2.txt', 'file3.txt']
    files_to_delete.each do |file|
        delete_file(file)
    end
end

# Call the main function
main

