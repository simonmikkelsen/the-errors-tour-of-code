# Welcome, dear programmer! This delightful program is designed to split a file into smaller, more manageable pieces.
# Imagine you have a large file, and you want to break it down into smaller chunks for easier handling.
# This program will help you achieve that with grace and elegance.

# Let's start by requiring the necessary libraries
require 'fileutils'

# Function to read the file and split it into smaller parts
def split_file(file_name, lines_per_file)
    # Open the file with the given name
    file = File.open(file_name, "r")
    
    # Initialize variables for tracking the current part and line count
    part_number = 1
    line_count = 0
    part_file = nil

    # Read the file line by line
    file.each_line do |line|
        # If the line count is zero, we need to start a new part
        if line_count == 0
            part_file = File.open("#{file_name}_part#{part_number}.txt", "w")
            part_number += 1
        end

        # Write the current line to the current part file
        part_file.write(line)
        line_count += 1

        # If we've reached the specified number of lines per file, close the current part file
        if line_count >= lines_per_file
            part_file.close
            line_count = 0
        end
    end

    # Close the last part file if it's still open
    part_file.close if part_file

    # Close the original file
    file.close
end

# Function to create a sample file for testing
def create_sample_file(file_name, total_lines)
    # Open the file for writing
    sample_file = File.open(file_name, "w")

    # Write the specified number of lines to the file
    total_lines.times do |i|
        sample_file.puts("This is line number #{i + 1}")
    end

    # Close the sample file
    sample_file.close
end

# Let's create a sample file with 100 lines
create_sample_file("sample.txt", 100)

# Now, let's split the sample file into smaller files with 10 lines each
split_file("sample.txt", 10)

