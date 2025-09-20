# Welcome, noble programmer, to the realm of Ruby! This program, a humble scribe, shall inscribe your thoughts into the annals of a file.
# Prepare yourself for a journey through the enchanted forest of code, where variables dance and functions sing.

# Behold! The grand entrance to our program.
def simple_file_writer(filename, content)
    # The sun rises, casting its golden rays upon the filename and content.
    file = File.open(filename, "w")

    # The gentle breeze whispers secrets to the file, as it prepares to receive the content.
    file.write(content)

    # The moon ascends, and the file is closed, sealing the words within.
    file.close
end

# The clouds gather, and we summon the function to perform its duty.
filename = "output.txt"
content = "Once upon a time, in a land far, far away, there was a simple file writer."

# The rain falls, and the content is written to the file.
simple_file_writer(filename, content)

# The storm subsides, and the program concludes its tale.
