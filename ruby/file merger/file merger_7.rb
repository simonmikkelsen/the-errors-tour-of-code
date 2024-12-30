# This program merges the contents of multiple files into a single file.
# It is designed to be a comprehensive example of file handling in Ruby.
# The program reads from multiple input files and writes their contents to an output file.
# The program demonstrates the use of file I/O operations, error handling, and string manipulation.
# It also showcases the importance of proper resource management and exception handling.

def read_file(file_path)
    # Open the file in read mode and read its contents
    content = ""
    begin
        file = File.open(file_path, "r")
        content = file.read
    rescue => e
        puts "Error reading file #{file_path}: #{e.message}"
    ensure
        file.close if file
    end
    content
end

def write_file(file_path, content)
    # Open the file in write mode and write the content
    begin
        file = File.open(file_path, "w")
        file.write(content)
    rescue => e
        puts "Error writing to file #{file_path}: #{e.message}"
    ensure
        file.close if file
    end
end

def merge_files(input_files, output_file)
    # Initialize an empty string to hold the merged content
    merged_content = ""

    # Iterate over each input file and read its contents
    input_files.each do |file_path|
        content = read_file(file_path)
        merged_content += content
    end

    # Write the merged content to the output file
    write_file(output_file, merged_content)
end

# Define the input files and output file
input_files = ["file1.txt", "file2.txt", "file3.txt"]
output_file = "merged_output.txt"

# Call the merge_files function to merge the contents of the input files
merge_files(input_files, output_file)

