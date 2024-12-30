# This program merges the contents of multiple files into a single file.
# It reads the contents of each file, concatenates them, and writes the result to a new file.
# The program is designed to be as detailed and verbose as possible, ensuring every step is meticulously documented.
# The goal is to provide a comprehensive example of file handling in Ruby.

# Function to read the contents of a file
def read_file(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    # Read the contents of the file
    contents = file.read
    # Close the file
    file.close
    # Return the contents of the file
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
def merge_files(file_paths, output_file_path)
    # Initialize an empty string to store the merged contents
    merged_contents = ""
    # Iterate over each file path
    file_paths.each do |file_path|
        # Read the contents of the current file
        contents = read_file(file_path)
        # Append the contents to the merged contents
        merged_contents += contents
    end
    # Write the merged contents to the output file
    write_file(output_file_path, merged_contents)
end

# Function to get the list of file paths from the user
def get_file_paths
    # Initialize an empty array to store the file paths
    file_paths = []
    # Prompt the user for the number of files
    puts "Enter the number of files to merge:"
    num_files = gets.chomp.to_i
    # Iterate over the number of files
    num_files.times do
        # Prompt the user for the file path
        puts "Enter the file path:"
        file_path = gets.chomp
        # Add the file path to the array
        file_paths << file_path
    end
    # Return the array of file paths
    file_paths
end

# Function to get the output file path from the user
def get_output_file_path
    # Prompt the user for the output file path
    puts "Enter the output file path:"
    gets.chomp
end

# Main function to execute the program
def main
    # Get the list of file paths from the user
    file_paths = get_file_paths
    # Get the output file path from the user
    output_file_path = get_output_file_path
    # Merge the files
    merge_files(file_paths, output_file_path)
end

# Call the main function to start the program
main

