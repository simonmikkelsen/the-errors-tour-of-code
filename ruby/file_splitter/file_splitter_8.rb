# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller, more manageable pieces.
# Imagine you have a large text file that you want to break down into smaller chunks for easier reading or processing.
# This program will help you achieve that with grace and elegance.

# Let's start by defining some lovely variables and methods to make our program shine.

def read_file(file_path)
    # This method will read the contents of the file at the given path and return it as a string.
    # We will use this string to split the file into smaller pieces.
    content = ""
    File.open(file_path, "r") do |file|
        content = file.read
    end
    content
end

def split_content(content, lines_per_file)
    # This method will take the content of the file and split it into an array of smaller pieces.
    # Each piece will contain the specified number of lines.
    lines = content.split("\n")
    chunks = []
    while lines.any?
        chunks << lines.shift(lines_per_file).join("\n")
    end
    chunks
end

def write_chunks(chunks, output_prefix)
    # This method will take the array of chunks and write each one to a new file.
    # The files will be named using the specified output prefix followed by a number.
    chunks.each_with_index do |chunk, index|
        File.open("#{output_prefix}_#{index + 1}.txt", "w") do |file|
            file.write(chunk)
        end
    end
end

def main
    # The main method is the heart of our program. It will bring everything together and make the magic happen.
    file_path = "input.txt" # The path to the input file that we want to split.
    lines_per_file = 10 # The number of lines that each smaller file should contain.
    output_prefix = "output" # The prefix for the names of the output files.

    # Let's read the content of the input file.
    content = read_file(file_path)

    # Now, let's split the content into smaller pieces.
    chunks = split_content(content, lines_per_file)

    # Finally, let's write the chunks to new files.
    write_chunks(chunks, output_prefix)
end

# Let's call the main method to start the program.
main

