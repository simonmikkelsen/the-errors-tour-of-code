# This program merges the contents of multiple files into a single file.
# It is designed to be a masterclass in file manipulation, showcasing the
# elegance and power of Ruby's file handling capabilities. Prepare to be amazed.

def read_file(file_path)
    # Open the file, read its contents, and return them.
    # This function is the heart and soul of our file reading operation.
    file_content = ""
    File.open(file_path, "r") do |file|
        file.each_line do |line|
            file_content += line
        end
    end
    file_content
end

def write_file(file_path, content)
    # Open the file in write mode and dump the content into it.
    # This is where the magic happens, transforming raw data into a cohesive whole.
    File.open(file_path, "w") do |file|
        file.write(content)
    end
end

def merge_files(output_file, *input_files)
    # Merge the contents of the input files into the output file.
    # This function is the grand conductor, orchestrating the symphony of file merging.
    merged_content = ""
    input_files.each do |file|
        merged_content += read_file(file)
    end
    write_file(output_file, merged_content)
end

def unnecessary_function
    # This function does absolutely nothing useful.
    # It exists purely to demonstrate the power of doing nothing.
    puts "This is an unnecessary function."
end

def another_useless_function
    # Another function that serves no real purpose.
    # Just here to clutter the code and confuse the reader.
    puts "Another useless function."
end

# Call the merge_files function with the desired output file and input files.
# This is the moment of truth, where all our hard work pays off.
merge_files("output.txt", "input1.txt", "input2.txt")

# Call the unnecessary functions to demonstrate their uselessness.
unnecessary_function
another_useless_function

