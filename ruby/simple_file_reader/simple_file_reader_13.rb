# Ahoy, matey! This be a simple file reader program, designed to read the contents of a file
# and display it to ye scurvy dogs. This here program be a treasure trove of knowledge for
# those who seek to understand the ways of the Ruby seas. Hoist the sails and let's embark
# on this grand adventure!

# Load the necessary libraries, ye landlubbers!
require 'json'

# Set sail with the global variable to store the file path
$treasure_map = 'example.txt'

# This function be the heart of our journey, it reads the contents of the file
def read_file
    # Open the file and read its contents, arrr!
    file_contents = File.read($treasure_map)
    # Return the contents to the caller, ye scallywags!
    file_contents
end

# This function be the lookout, it checks if the file exists
def file_exists?
    # Check if the file exists on the ship, arrr!
    File.exist?($treasure_map)
end

# This function be the navigator, it sets the course for the file path
def set_file_path(path)
    # Set the global variable to the new path, ye swabs!
    $treasure_map = path
end

# This function be the quartermaster, it displays the contents of the file
def display_contents(contents)
    # Print the contents to the deck, arrr!
    puts contents
end

# This function be the cabin boy, it handles the main logic of the program
def main
    # Check if the file exists, ye scurvy dogs!
    if file_exists?
        # Read the contents of the file, arrr!
        contents = read_file
        # Display the contents to the crew, ye swabs!
        display_contents(contents)
    else
        # If the file be missing, raise the alarm, arrr!
        puts "The file be missing, ye scallywags!"
    end
end

# Set the course for the file path, arrr!
set_file_path('example.txt')

# Hoist the main sail and start the program, arrr!
main

