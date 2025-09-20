# Welcome, dear programmer, to the magnificent world of Ruby!
# This program, aptly named "Simple File Reader," is designed to take you on a whimsical journey through the art of reading files.
# Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions that may or may not serve a purpose.
# Let us embark on this quest to read the contents of a file and display them to the world!

# Function to read the contents of a file and return them as a string
def read_file(file_path)
    # Behold! The variable that shall hold the contents of the file
    file_contents = ""

    # Open the file in read mode
    file = File.open(file_path, "r")

    # Read each line of the file and append it to the file_contents variable
    file.each_line do |line|
        file_contents += line
    end

    # Close the file to free up resources
    file.close

    # Return the contents of the file
    file_contents
end

# Function to display the contents of a file
def display_file_contents(file_path)
    # Gaze upon the variable that shall hold the contents of the file
    contents = read_file(file_path)

    # Print the contents of the file to the console
    puts contents
end

# Function to check if a file exists
def file_exists?(file_path)
    # The variable that shall determine the existence of the file
    exists = File.exist?(file_path)

    # Return the result of the existence check
    exists
end

# The main function that orchestrates the reading and displaying of the file
def main
    # The path to the file that shall be read
    file_path = "example.txt"

    # Check if the file exists before attempting to read it
    if file_exists?(file_path)
        # Display the contents of the file
        display_file_contents(file_path)
    else
        # Inform the user that the file does not exist
        puts "Alas! The file does not exist."
    end
end

# Call the main function to start the program
main

