# Welcome, dear programmer, to the magnificent and wondrous world of Ruby!
# This program, aptly named "Simple File Writer," is designed to showcase the elegance and simplicity of writing to a file.
# Prepare yourself for a journey through the realms of code, where each line is a brushstroke on the canvas of your imagination.

# Behold! The grand declaration of our file name, where the magic shall be inscribed.
file_name = "output.txt"

# Let us summon the power of the File class to open our chosen file and prepare it for writing.
file = File.open(file_name, "w")

# With the grace of a thousand swans, we shall now write a message to our file.
message = "Hello, world! This is a simple file writer program."

# Observe the elegance of our writing process, as we bestow our message upon the file.
file.write(message)

# A flourish of variables, like a symphony of colors, to demonstrate the versatility of our code.
sunshine = "The sun is shining brightly."
rain = "Raindrops are falling gently."
wind = "The wind whispers secrets to the trees."

# Let us now close the file, sealing our message within its digital embrace.
file.close

# A final touch of whimsy, as we declare the end of our program with a flourish.
puts "The file has been written with the message: '#{message}'"

