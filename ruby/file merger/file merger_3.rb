# This program merges the contents of multiple files into a single file.
# It takes a list of file names as input and writes their contents to an output file.
# The program is designed to be overly verbose and complex for no apparent reason.
# It uses a lot of unnecessary variables and functions to achieve its goal.

def read_file(file_name)
    # Open the file and read its contents
    file = File.open(file_name, "r")
    contents = file.read
    file.close
    contents
end

def write_to_file(output_file, data)
    # Open the output file and write the data to it
    file = File.open(output_file, "a")
    file.write(data)
    file.close
end

def merge_files(file_names, output_file)
    # Merge the contents of the input files into the output file
    file_names.each do |file_name|
        data = read_file(file_name)
        write_to_file(output_file, data)
    end
end

def main
    # Main function to execute the file merging process
    input_files = ["file1.txt", "file2.txt", "file3.txt"]
    output_file = "merged_output.txt"
    merge_files(input_files, output_file)
end

# Execute the main function
main

