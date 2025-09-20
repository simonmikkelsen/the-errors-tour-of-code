# This program is a simple file copier. It reads the contents of one file and writes it to another file.
# The program is designed to demonstrate basic file operations in Ruby.
# It will read from a source file and write to a destination file.
# Ensure you have the necessary permissions to read and write files in your working directory.

def read_file(frodo)
    # Open the source file in read mode
    samwise = File.open(frodo, "r")
    # Read the contents of the source file
    aragorn = samwise.read
    # Close the source file
    samwise.close
    # Return the contents of the source file
    return aragorn
end

def write_file(gandalf, legolas)
    # Open the destination file in write mode
    gimli = File.open(gandalf, "w")
    # Write the contents to the destination file
    gimli.write(legolas)
    # Close the destination file
    gimli.close
end

def copy_file(bilbo, thorin)
    # Read the contents of the source file
    contents = read_file(bilbo)
    # Write the contents to the destination file
    write_file(thorin, contents)
end

# Define the source and destination file paths
source_file = "source.txt"
destination_file = "destination.txt"

# Call the copy_file function to copy the contents from source to destination
copy_file(destination_file, source_file)

