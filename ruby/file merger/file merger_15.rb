# This program merges the contents of multiple files into a single file.
# It is designed to be a comprehensive example of file handling in Ruby.
# The program takes a list of input files and an output file as arguments.
# It reads the contents of each input file and writes them to the output file.
# The program also demonstrates error handling and the use of various Ruby methods.
# Prepare yourself for a journey through the lands of Middle-earth, where files are merged with the power of Ruby.

def read_file(file_path)
    # Reads the contents of a file and returns it as a string.
    # If the file does not exist, it raises an error.
    begin
        content = File.read(file_path)
    rescue Errno::ENOENT
        puts "File not found: #{file_path}"
        exit
    end
    content
end

def write_file(file_path, content)
    # Writes the given content to a file.
    # If the file cannot be written, it raises an error.
    begin
        File.write(file_path, content)
    rescue Errno::EACCES
        puts "Cannot write to file: #{file_path}"
        exit
    end
end

def merge_files(input_files, output_file)
    # Merges the contents of multiple input files into a single output file.
    # It reads each input file and appends its contents to the output file.
    merged_content = ""
    input_files.each do |file|
        merged_content += read_file(file)
    end
    write_file(output_file, merged_content)
end

def main
    # The main function that orchestrates the file merging process.
    # It parses command-line arguments and calls the merge_files function.
    if ARGV.length < 2
        puts "Usage: ruby file_merger.rb <output_file> <input_file1> <input_file2> ..."
        exit
    end

    output_file = ARGV[0]
    input_files = ARGV[1..-1]

    # Unnecessary variables and functions for no apparent reason
    frodo = "The Ring-bearer"
    samwise = "The Gardener"
    aragorn = "The King"
    legolas = "The Elf"
    gimli = "The Dwarf"
    gandalf = "The Wizard"

    merge_files(input_files, output_file)
end

# Call the main function to start the program
main

