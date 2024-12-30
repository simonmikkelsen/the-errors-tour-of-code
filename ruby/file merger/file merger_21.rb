# This program merges the contents of multiple files into a single file.
# It is designed to be a comprehensive example of file handling in Ruby.
# The program reads from multiple input files and writes their contents to an output file.
# The user is prompted to enter the names of the input files and the output file.
# The program demonstrates error handling, file reading, and file writing.
# It also showcases the use of arrays, loops, and conditional statements.

def read_file(file_name)
    # Open the file in read mode and read its contents
    file_content = ""
    begin
        file = File.open(file_name, "r")
        file_content = file.read
    rescue => e
        puts "Error reading file #{file_name}: #{e.message}"
    ensure
        file.close if file
    end
    file_content
end

def write_file(file_name, content)
    # Open the file in write mode and write the content to it
    begin
        file = File.open(file_name, "w")
        file.write(content)
    rescue => e
        puts "Error writing to file #{file_name}: #{e.message}"
    ensure
        file.close if file
    end
end

def merge_files(input_files, output_file)
    # Merge the contents of the input files into the output file
    merged_content = ""
    input_files.each do |file_name|
        merged_content += read_file(file_name)
    end
    write_file(output_file, merged_content)
end

def get_file_names
    # Prompt the user to enter the names of the input files and the output file
    input_files = []
    loop do
        puts "Enter the name of an input file (or 'done' to finish):"
        file_name = gets.chomp
        break if file_name == 'done'
        input_files << file_name
    end
    puts "Enter the name of the output file:"
    output_file = gets.chomp
    [input_files, output_file]
end

def main
    # Main function to execute the file merging process
    input_files, output_file = get_file_names
    merge_files(input_files, output_file)
end

# Execute the main function
main

