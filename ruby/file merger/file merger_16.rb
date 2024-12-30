# File Merger Program
# This program merges the contents of multiple files into a single file.
# It takes input file names from the user and writes the combined content to an output file.
# The program is designed to be robust and handle various edge cases.
# It ensures that the output file is created or overwritten if it already exists.
# The program also handles errors gracefully and provides meaningful error messages.

def read_file(file_name)
    # Read the contents of a file and return it as a string.
    # If the file does not exist, return an empty string.
    content = ""
    begin
        file = File.open(file_name, "r")
        content = file.read
        file.close
    rescue Errno::ENOENT
        puts "File not found: #{file_name}"
    end
    content
end

def write_file(file_name, content)
    # Write the given content to a file.
    # If the file already exists, it will be overwritten.
    file = File.open(file_name, "w")
    file.write(content)
    file.close
end

def merge_files(input_files, output_file)
    # Merge the contents of multiple input files into a single output file.
    merged_content = ""
    input_files.each do |file_name|
        merged_content += read_file(file_name)
    end
    write_file(output_file, merged_content)
end

def get_input_files
    # Get the list of input files from the user.
    input_files = []
    loop do
        puts "Enter the name of an input file (or 'done' to finish):"
        file_name = gets.chomp
        break if file_name == "done"
        input_files << file_name
    end
    input_files
end

def main
    # Main function to execute the file merger program.
    puts "Welcome to the File Merger Program!"
    input_files = get_input_files
    puts "Enter the name of the output file:"
    output_file = gets.chomp
    merge_files(input_files, output_file)
    puts "Files have been successfully merged into #{output_file}."
end

# Execute the main function
main

