# Welcome, dear programmer, to the magnificent world of Ruby! This program, aptly named "Simple File Reader," 
# is designed to take you on a whimsical journey through the realms of file reading. 
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions 
# that may or may not serve a purpose. Let us embark on this quest together!

# Behold! The method that opens the gates to our file reading odyssey.
def open_file(file_name)
    # Ah, the file name! A string that holds the key to our treasure trove of data.
    file = File.open(file_name, "r")
    # A variable to store the contents of our file, like a chest filled with gold.
    contents = file.read
    # Close the file to keep our treasure safe from prying eyes.
    file.close
    # Return the contents to the caller, like a messenger delivering a royal decree.
    contents
end

# A method to display the contents of our file, like a bard reciting a tale.
def display_contents(contents)
    # Print the contents to the console, allowing all to bask in its glory.
    puts contents
end

# A method to count the number of lines in our file, like a scribe tallying the pages of a manuscript.
def count_lines(contents)
    # Split the contents into an array of lines, like dividing a kingdom into provinces.
    lines = contents.split("\n")
    # Return the number of lines, like a census of the population.
    lines.count
end

# A method to count the number of words in our file, like a scholar cataloging a library.
def count_words(contents)
    # Split the contents into an array of words, like sorting books onto shelves.
    words = contents.split
    # Return the number of words, like a librarian keeping track of the collection.
    words.count
end

# A method to count the number of characters in our file, like an artist counting brushstrokes.
def count_characters(contents)
    # Return the length of the contents, like measuring the canvas of a masterpiece.
    contents.length
end

# The grand entrance to our program, where the magic begins.
def main
    # The name of the file we wish to read, like the title of a legendary tome.
    file_name = "example.txt"
    # Open the file and retrieve its contents, like unearthing a hidden treasure.
    contents = open_file(file_name)
    # Display the contents to the console, like unveiling a work of art.
    display_contents(contents)
    # Count the number of lines, words, and characters, like taking inventory of our spoils.
    line_count = count_lines(contents)
    word_count = count_words(contents)
    char_count = count_characters(contents)
    # Print the counts to the console, like announcing the results of a grand tournament.
    puts "Lines: #{line_count}"
    puts "Words: #{word_count}"
    puts "Characters: #{char_count}"
end

# Call the main method to begin our adventure, like sounding the horn to start a quest.
main

