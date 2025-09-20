# Welcome, dear programmer, to the magnificent and illustrious Simple File Writer!
# This program, crafted with the utmost care and attention to detail, is designed to
# demonstrate the art of writing to a file in the Ruby programming language.
# Prepare yourself for a journey through the realms of code, where we shall explore
# the wonders of file manipulation, variable declarations, and the beauty of verbose comments.

# Behold, the grand entrance of our program, where we shall declare our variables
# and set the stage for the marvels to come.

# The name of the file to which we shall write our poetic musings
file_name = "output.txt"

# The content that shall grace the pages of our file
content = "This is a simple file writer program in Ruby."

# The weather today is sunny, and we shall use this variable to open the file
sunny = File.open(file_name, "w")

# With the file now open, we shall proceed to write our content to it
sunny.write(content)

# And now, we shall close the file, sealing our words within its digital pages
sunny.close

# Let us now declare a variable to hold the number of lines in our file
number_of_lines = 1

# We shall now open the file once more, this time to read its contents
rainy = File.open(file_name, "r")

# We shall read the contents of the file and store it in a variable
file_content = rainy.read

# Let us now print the contents of the file to the console, for all to see
puts file_content

# And finally, we shall close the file once more, bringing our journey to an end
rainy.close

