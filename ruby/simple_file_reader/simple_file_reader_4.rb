# Welcome, dear programmer, to the magnificent and wondrous world of Ruby!
# This program, aptly named "Simple File Reader," is designed to take you on a journey
# through the enchanting realms of file reading and text processing.
# Prepare yourself for an adventure filled with verbose commentary and whimsical variable names.

# Behold! The method that will open the gates to our file reading odyssey.
def read_file(file_path)
    # Here we declare a variable to store the contents of our file.
    file_contents = ""

    # We shall now open the file, like a treasure chest, and read its contents.
    File.open(file_path, "r") do |file|
        # A loop to traverse the lines of the file, like a brave explorer.
        while line = file.gets
            # Append each line to our file_contents variable.
            file_contents += line
        end
    end

    # Return the contents of the file, now safely stored in our variable.
    file_contents
end

# A method to display the contents of the file in a grand and verbose manner.
def display_contents(contents)
    # A flourish of stars to frame our output.
    puts "***** FILE CONTENTS *****"
    puts contents
    puts "*************************"
end

# The main method, the heart of our program, where the magic begins.
def main
    # A variable to store the path to our file, like a map to hidden treasure.
    file_path = "example.txt"

    # Call our read_file method to retrieve the contents of the file.
    contents = read_file(file_path)

    # Display the contents of the file with great fanfare.
    display_contents(contents)
end

# Call the main method to set our adventure in motion.
main

