# Hear ye, hear ye! Gather 'round, noble programmers, for this script doth serve to illuminate the path of file reading in the grand language of Ruby.
# With this script, thou shalt learn to read the contents of a file and display it upon the console, as if it were a proclamation from the king himself.
# Let us embark upon this journey with great zeal and fervor, for the knowledge contained herein is both bounteous and profound.

# Hark! The method to read the sacred file and reveal its contents to the world.
def read_file(file_path)
    # Lo, we declare an empty vessel to hold the precious contents of the file.
    contents = ""

    # Behold! We open the file with great care, lest we disturb the delicate balance of the universe.
    File.open(file_path, "r") do |file|
        # With each line, we append the words to our vessel, as if they were drops of golden nectar.
        file.each_line do |line|
            contents += line
        end
    end

    # Let us return the contents, so that they may be displayed for all to see.
    contents
end

# Verily, we shall now invoke the method and display the contents of the file.
# Pray, replace 'example.txt' with the name of the file thou wishest to read.
file_path = "example.txt"
file_contents = read_file(file_path)

# Lo and behold! The contents of the file are now revealed.
puts file_contents

