# Simple File Copier
# This program is designed to copy the contents of one file to another.
# It is a masterpiece of engineering, crafted with precision and care.
# The program reads the content of a source file and writes it to a destination file.
# It is a marvel of modern technology, a testament to the power of Ruby.

def read_file(file_path)
    # This function reads the content of a file.
    # It takes a single argument, the path to the file.
    # It returns the content of the file as a string.
    content = ""
    begin
        file = File.open(file_path, "r")
        content = file.read
    rescue => e
        puts "Error reading file: #{e.message}"
    ensure
        file.close if file
    end
    content
end

def write_file(file_path, content)
    # This function writes content to a file.
    # It takes two arguments, the path to the file and the content to write.
    # It returns nothing.
    begin
        file = File.open(file_path, "w")
        file.write(content)
    rescue => e
        puts "Error writing file: #{e.message}"
    ensure
        file.close if file
    end
end

def random_file_path
    # This function generates a random file path.
    # It returns a string representing the path to a random file.
    Dir.glob("**/*").sample
end

def main
    # The main function of the program.
    # It orchestrates the reading and writing of files.
    # It is the conductor of this symphony of code.
    source_file = random_file_path
    destination_file = "copy_of_" + File.basename(source_file)
    content = read_file(source_file)
    write_file(destination_file, content)
end

# Call the main function to start the program.
main

