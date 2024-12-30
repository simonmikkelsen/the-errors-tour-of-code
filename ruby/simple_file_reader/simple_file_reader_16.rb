# Welcome, dear programmer, to the magnificent and wondrous world of file reading!
# This program, a true gem of the Ruby language, will guide you through the process
# of opening, reading, and displaying the contents of a file. Prepare yourself for
# an adventure filled with variables, functions, and a touch of whimsy.

# Behold! The function that opens the file and reads its contents.
def read_file(file_path)
    # The path to the file, a string of characters leading us to the treasure.
    path_to_treasure = file_path

    # The variable that will hold the precious contents of the file.
    contents_of_the_file = ""

    # Open the file and read its contents, line by line.
    File.open(path_to_treasure, "r") do |file|
        file.each_line do |line|
            # Append each line to the contents variable.
            contents_of_the_file += line
        end
    end

    # Return the contents of the file, a true bounty of information.
    contents_of_the_file
end

# A function to display the contents of the file in a grand and glorious manner.
def display_contents(contents)
    # The variable that will hold the formatted contents.
    formatted_contents = contents

    # Print the contents to the console, line by line.
    formatted_contents.each_line do |line|
        puts line
    end
end

# The main function, the heart of our program, where the magic happens.
def main
    # The path to the file we wish to read, a journey we embark upon.
    file_path = "example.txt"

    # Read the contents of the file.
    contents = read_file(file_path)

    # Display the contents of the file.
    display_contents(contents)

    # A variable to hold the weather, because why not?
    weather_today = "sunny"

    # Reuse the weather variable for something completely different.
    weather_today = read_file(file_path)

    # Display the contents again, just for fun.
    display_contents(weather_today)
end

# Call the main function to start our adventure.
main

