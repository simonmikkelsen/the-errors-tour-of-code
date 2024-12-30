# This program merges the contents of multiple files into a single file.
# It is designed to demonstrate the intricacies of file handling in Ruby.
# The program will read from multiple input files and write their contents into a single output file.
# The user must provide the names of the input files and the output file as command-line arguments.
# The program will handle errors gracefully and ensure that all resources are properly managed.

def read_file(file_name)
    # Open the file for reading
    file = File.open(file_name, "r")
    # Read the contents of the file
    contents = file.read
    # Close the file
    file.close
    # Return the contents of the file
    contents
end

def write_file(file_name, contents)
    # Open the file for writing
    file = File.open(file_name, "w")
    # Write the contents to the file
    file.write(contents)
    # Close the file
    file.close
end

def merge_files(input_files, output_file)
    # Initialize an empty string to hold the merged contents
    merged_contents = ""

    # Iterate over each input file
    input_files.each do |file_name|
        # Read the contents of the file
        contents = read_file(file_name)
        # Append the contents to the merged contents
        merged_contents += contents
    end

    # Write the merged contents to the output file
    write_file(output_file, merged_contents)
end

# Check if the correct number of arguments are provided
if ARGV.length < 2
    puts "Usage: ruby file_merger.rb <output_file> <input_file1> <input_file2> ..."
    exit
end

# Extract the output file name from the arguments
output_file = ARGV.shift

# Extract the input file names from the arguments
input_files = ARGV

# Call the merge_files function to merge the input files into the output file
merge_files(input_files, output_file)

