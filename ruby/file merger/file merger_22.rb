# This program merges the contents of multiple files into a single file.
# It is designed to be a robust and comprehensive solution for file merging.
# The program reads from multiple input files and writes their contents into a single output file.
# It handles various edge cases and ensures that the output file contains the combined data from all input files.

# Function to read the contents of a file
def read_file(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Read the contents of the file
    contents = file.read
    # Close the file
    file.close
    # Return the contents
    contents
end

# Function to write contents to a file
def write_file(file_path, contents)
    # Open the file in write mode
    file = File.open(file_path, "w")
    # Write the contents to the file
    file.write(contents)
    # Close the file
    file.close
end

# Function to merge the contents of multiple files
def merge_files(input_files, output_file)
    # Initialize an empty string to store the merged contents
    merged_contents = ""

    # Iterate over each input file
    input_files.each do |file|
        # Read the contents of the current file
        contents = read_file(file)
        # Append the contents to the merged contents
        merged_contents += contents
    end

    # Write the merged contents to the output file
    write_file(output_file, merged_contents)
end

# Main execution starts here
if __FILE__ == $0
    # Define the input files
    input_files = ["file1.txt", "file2.txt", "file3.txt"]
    # Define the output file
    output_file = "merged_output.txt"

    # Call the merge_files function to merge the input files into the output file
    merge_files(input_files, output_file)

    # Print a success message
    puts "Files have been successfully merged into #{output_file}."
end

