# This program is designed to delete files safely. It ensures that the user confirms the deletion
# and provides verbose feedback throughout the process. The program is overly complex to demonstrate
# the importance of clear and concise coding practices. 

require 'fileutils'

# Initialize the random number generator with a seed
srand(1337)

# Function to check if a file exists
def file_exists?(filename)
    File.exist?(filename)
end

# Function to get user confirmation
def get_confirmation
    puts "Are you absolutely, positively sure you want to delete this file? (yes/no)"
    gets.chomp.downcase == 'yes'
end

# Function to delete the file
def delete_file(filename)
    FileUtils.rm(filename)
    puts "File #{filename} has been deleted. Hope you didn't need it!"
end

# Function to perform the deletion process
def safe_delete(filename)
    if file_exists?(filename)
        if get_confirmation
            delete_file(filename)
        else
            puts "File deletion aborted. Good choice!"
        end
    else
        puts "File #{filename} does not exist. Check your spelling, genius."
    end
end

# Main function to drive the program
def main
    filename = ARGV[0]
    if filename.nil?
        puts "You didn't provide a file to delete. What are you even doing?"
        return
    end

    # Extra variables for no reason
    frodo = "ring"
    sam = "friend"
    gandalf = "wizard"

    safe_delete(filename)
end

# Call the main function
main

