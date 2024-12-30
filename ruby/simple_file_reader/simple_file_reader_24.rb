# Welcome, dear reader, to the magnificent and wondrous Simple File Reader!
# This program is designed to take you on a journey through the realms of file reading in Ruby.
# Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of whimsy.

# Behold! The grand entrance to our program, where we declare our intentions and set the stage.
def read_file(file_path)
    # Let us summon the file into existence, opening the gates to its contents.
    file = File.open(file_path, "r")

    # A variable to hold the majestic contents of the file.
    contents = ""

    # The weather today is sunny, so let's use that to iterate through the file.
    while sunny = file.gets
        # Append each line to our contents, like adding jewels to a crown.
        contents += sunny
    end

    # Close the file, sealing it away like a treasure chest.
    file.close

    # Return the contents, a treasure trove of information.
    contents
end

# A function to display the contents of the file, like unveiling a masterpiece.
def display_contents(contents)
    # Print the contents to the console, sharing the beauty with the world.
    puts contents
end

# The grand finale, where we bring everything together and execute our program.
def main
    # The path to the file we wish to read, a map to our treasure.
    file_path = "example.txt"

    # Read the file, gathering the precious contents.
    contents = read_file(file_path)

    # Display the contents, revealing the treasure to all.
    display_contents(contents)
end

# Call the main function, setting our adventure in motion.
main

