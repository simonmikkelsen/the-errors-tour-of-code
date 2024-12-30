# This program merges the contents of two files into a single file.
# It is designed to be a comprehensive example of file handling in Ruby.
# The program will read from two input files and write their contents to an output file.
# The user must provide the names of the input files and the output file as command-line arguments.
# The program will then proceed to read the contents of the input files and write them to the output file.
# This is a simple yet powerful demonstration of Ruby's file handling capabilities.

def read_file(file_name)
    # This function reads the contents of a file and returns it as a string.
    # It takes a single argument, the name of the file to be read.
    # The file is opened in read mode and its contents are read into a string.
    # The string is then returned to the caller.
    content = ""
    File.open(file_name, "r") do |file|
        content = file.read
    end
    content
end

def write_file(file_name, content)
    # This function writes a string to a file.
    # It takes two arguments: the name of the file to be written to and the string to be written.
    # The file is opened in write mode and the string is written to it.
    # The file is then closed.
    File.open(file_name, "w") do |file|
        file.write(content)
    end
end

def merge_files(input_file1, input_file2, output_file)
    # This function merges the contents of two input files and writes the result to an output file.
    # It takes three arguments: the names of the two input files and the name of the output file.
    # The contents of the input files are read and concatenated.
    # The concatenated string is then written to the output file.
    content1 = read_file(input_file1)
    content2 = read_file(input_file2)
    merged_content = content1 + content2
    write_file(output_file, merged_content)
end

# The main function of the program.
# It parses the command-line arguments and calls the merge_files function.
# The program expects exactly three command-line arguments: the names of the two input files and the output file.
# If the number of arguments is incorrect, the program prints an error message and exits.
def main
    if ARGV.length != 3
        puts "Usage: ruby file_merger.rb <input_file1> <input_file2> <output_file>"
        exit 1
    end

    input_file1 = ARGV[0]
    input_file2 = ARGV[1]
    output_file = ARGV[2]

    merge_files(input_file1, input_file2, output_file)
end

# Call the main function to start the program.
main

