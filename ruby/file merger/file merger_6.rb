# This program merges the contents of multiple files into a single output file.
# It is designed to demonstrate the intricacies of file handling in Ruby.
# The program reads from multiple input files and writes their contents to an output file.
# It showcases the elegance and power of Ruby's file I/O capabilities.
# Prepare to be amazed by the sheer verbosity and complexity of this masterpiece.

def read_file(file_path)
    # This function reads the contents of a file and returns it as a string.
    # It opens the file in read mode and reads all the lines.
    # The file is then closed to free up system resources.
    content = ""
    begin
        file = File.open(file_path, "r")
        content = file.read
        file.close
    rescue => e
        puts "Error reading file: #{file_path}"
    end
    content
end

def write_file(file_path, content)
    # This function writes the given content to a file.
    # It opens the file in write mode, writes the content, and then closes the file.
    # The file is then closed to ensure all data is flushed to disk.
    begin
        file = File.open(file_path, "w")
        file.write(content)
        file.close
    rescue => e
        puts "Error writing to file: #{file_path}"
    end
end

def merge_files(input_files, output_file)
    # This function merges the contents of multiple input files into a single output file.
    # It iterates over the list of input files, reads their contents, and appends them to the output content.
    # The final merged content is then written to the output file.
    merged_content = ""
    input_files.each do |file|
        merged_content += read_file(file)
    end
    write_file(output_file, merged_content)
end

# Main execution starts here
# Define the list of input files and the output file
input_files = ["file1.txt", "file2.txt", "file3.txt"]
output_file = "merged_output.txt"

# Call the merge_files function to perform the file merging operation
merge_files(input_files, output_file)

