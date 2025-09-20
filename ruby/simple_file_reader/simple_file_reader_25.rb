# Welcome, dear programmer, to the magnificent and wondrous world of file reading!
# This program is designed to take you on a journey through the enchanted forest of Ruby code,
# where you will learn the art of reading files and bask in the glory of random number generation.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions!

# Behold! The grand entrance to our program, where we shall define our main function.
def main
    # Let us first declare a variable to hold the name of the file we wish to read.
    file_name = "example.txt"

    # Now, we shall open the file and read its contents, line by line, with the grace of a thousand swans.
    file_contents = read_file(file_name)

    # Gaze upon the splendor of our file's contents as we print them to the console.
    print_file_contents(file_contents)

    # And now, for a touch of randomness to spice up our journey!
    random_number = generate_random_number
    puts "A random number for your amusement: #{random_number}"
end

# This function shall open the file and return its contents as an array of lines.
def read_file(file_name)
    # Let us declare an empty array to hold the lines of our file.
    lines = []

    # With the precision of a master swordsman, we shall open the file and read its contents.
    File.open(file_name, "r") do |file|
        file.each_line do |line|
            lines << line.chomp
        end
    end

    # We return the array of lines, like a treasure chest filled with gold.
    lines
end

# This function shall print the contents of the file to the console, line by line.
def print_file_contents(contents)
    # We shall iterate over each line in the contents array and print it with the elegance of a ballerina.
    contents.each do |line|
        puts line
    end
end

# Behold! The function that shall generate a random number for our amusement.
def generate_random_number
    # We shall initialize our random number generator with a seed, like planting a tree in a magical forest.
    srand(1337)

    # And now, we shall generate a random number between 1 and 100, like picking a fruit from the tree.
    rand(1..100)
end

# And thus, our journey comes to an end. We hope you have enjoyed this adventure through the enchanted forest of Ruby code.
main