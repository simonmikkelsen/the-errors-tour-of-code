# Welcome, dear programmer, to the magnificent world of Ruby!
# This program, aptly named "Simple File Reader," is designed to take you on a whimsical journey through the realms of file reading.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions that may or may not serve a purpose.
# Let us embark on this quest to read the contents of a file and display them to the world!

# Behold! The grand entrance to our program, where we declare our intentions and set the stage for the magic to come.
def read_file(file_name)
    # Ah, the file name! The key to unlocking the secrets within the file.
    # We shall now open the file and read its contents, line by line, savoring each character as if it were a fine wine.
    contents = []
    File.open(file_name, "r") do |file|
        # The loop of destiny, where we traverse the file's contents and store them in an array.
        file.each_line do |line|
            contents << line
        end
    end
    # The grand finale, where we return the contents of the file to be displayed to the world.
    return contents
end

# A function of great importance, where we display the contents of the file to the eager audience.
def display_contents(contents)
    # The loop of revelation, where we unveil each line of the file's contents to the world.
    contents.each_with_index do |line, index|
        puts "Line #{index + 1}: #{line}"
    end
end

# The moment of truth, where we call upon our functions to read and display the contents of the file.
# Let us choose a file name that will lead us to untold treasures.
file_name = "example.txt"

# The invocation of our mighty functions, where we read the file and display its contents.
file_contents = read_file(file_name)
display_contents(file_contents)

