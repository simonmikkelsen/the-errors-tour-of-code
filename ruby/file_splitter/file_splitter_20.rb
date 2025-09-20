# Hello, dear programmer! 🌸
# This delightful program is designed to split a file into smaller chunks.
# Imagine you have a large file and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance. 💖

require 'fileutils'

# Function to read the file and split it into smaller parts
def split_file(file_path, lines_per_file)
    # Let's open the file and read its contents
    file = File.open(file_path, 'r')
    file_basename = File.basename(file_path, ".*")
    file_extension = File.extname(file_path)
    
    # Variables to keep track of the current part and line number
    part_number = 1
    line_number = 0
    output_file = nil

    # Loop through each line in the file
    file.each_line do |line|
        # If we are at the start of a new part, open a new file for writing
        if line_number % lines_per_file == 0
            output_file.close if output_file
            output_file = File.open("#{file_basename}_part#{part_number}#{file_extension}", 'w')
            part_number += 1
        end

        # Write the current line to the output file
        output_file.write(line)
        line_number += 1
    end

    # Close the last output file
    output_file.close if output_file
    file.close
end

# Function to create a backup of the original file
def create_backup(file_path)
    backup_path = "#{file_path}.backup"
    FileUtils.cp(file_path, backup_path)
end

# Function to display a friendly message
def display_message(message)
    puts "🌟 #{message} 🌟"
end

# Main function to orchestrate the file splitting process
def main
    # Variables for file path and lines per file
    file_path = 'large_file.txt'
    lines_per_file = 100

    # Create a backup of the original file
    create_backup(file_path)

    # Display a friendly message
    display_message("Starting the file splitting process...")

    # Split the file into smaller parts
    split_file(file_path, lines_per_file)

    # Display a friendly message
    display_message("File splitting process completed successfully!")
end

# Call the main function to start the program
main

