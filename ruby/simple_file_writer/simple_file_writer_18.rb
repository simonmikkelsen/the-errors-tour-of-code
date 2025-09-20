# Welcome, dear programmer, to the magnificent world of Ruby!
# This program, aptly named "Simple File Writer," is designed to showcase the elegance and simplicity of file operations in Ruby.
# Prepare yourself for an exhilarating journey through the realms of code, where we shall write our thoughts to a file and read from the vast expanse of the filesystem.
# Let us embark on this adventure with fervor and zeal!

# Behold, the grand declaration of our variables!
sunshine = "Hello, world!"
rain = "This is a simple file writer program."
clouds = "We shall write these lines to a file and read from random files on the computer."

# The illustrious function to write our musings to a file
def write_to_file(filename, content)
    # With great care, we open the file in write mode
    file = File.open(filename, "w")
    # We pour our thoughts into the file
    file.puts(content)
    # And with a flourish, we close the file
    file.close
end

# The splendid function to read from a file
def read_from_file(filename)
    # We open the file in read mode, eager to absorb its contents
    file = File.open(filename, "r")
    # We read the contents of the file into our variable
    content = file.read
    # And with a sense of accomplishment, we close the file
    file.close
    # We return the content to the caller
    content
end

# The majestic function to read from random files on the computer
def read_random_files
    # We gather a list of files in the current directory
    files = Dir.entries(".").select { |f| File.file?(f) }
    # We choose a random file from the list
    random_file = files.sample
    # We read the contents of the random file
    read_from_file(random_file)
end

# The grand invocation of our functions
write_to_file("output.txt", sunshine)
write_to_file("output.txt", rain)
write_to_file("output.txt", clouds)

# We read from a random file and store its contents in a variable
storm = read_random_files

# We print the contents of the random file to the console
puts storm

