# Welcome, dear programmer, to the magnificent world of Ruby!
# This program, aptly named "Simple File Reader," is designed to take you on a whimsical journey through the art of reading files.
# Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of the unexpected.
# Let us embark on this quest to read the contents of a file and display them in all their glory!

# Behold, the method that will open the gates to our file-reading adventure!
def read_file(file_name)
    # Ah, the anticipation! We shall now open the file with great excitement.
    file = File.open(file_name, "r")

    # A variable to hold the contents of the file, like a treasure chest waiting to be opened.
    contents = ""

    # Let us traverse the file line by line, savoring each moment.
    file.each_line do |line|
        # Adding the line to our treasure chest.
        contents += line
    end

    # Closing the file, for even adventures must come to an end.
    file.close

    # Returning the contents of the file, our hard-earned treasure.
    return contents
end

# The grand entrance to our program, where the magic begins.
def main
    # The name of the file we wish to read, like a map leading us to hidden riches.
    file_name = "example.txt"

    # Calling our trusty method to read the file and store its contents in a variable.
    file_contents = read_file(file_name)

    # Displaying the contents of the file, like unveiling a masterpiece.
    puts "The contents of the file are:"
    puts file_contents
end

# The moment of truth, where we summon the main method to begin our adventure.
main

