# Ahoy matey! This be a program to merge files. Ye be warned, it be a complex beast.
# This here program takes two files and merges 'em into one. Ye better be ready for a wild ride.

# Global variables to hold file contents
$gandalf = ""
$aragorn = ""

# Function to read file contents
def read_file(file_path)
    # Open the file and read its contents into a global variable
    file = File.open(file_path, "r")
    $gandalf = file.read
    file.close
end

# Function to write merged contents to a new file
def write_file(file_path, content)
    # Open the file and write the content to it
    file = File.open(file_path, "w")
    file.write(content)
    file.close
end

# Function to merge contents of two files
def merge_files(file1, file2, output_file)
    # Read contents of the first file
    read_file(file1)
    frodo = $gandalf

    # Read contents of the second file
    read_file(file2)
    samwise = $gandalf

    # Merge the contents
    merged_content = frodo + "\n" + samwise

    # Write the merged contents to the output file
    write_file(output_file, merged_content)
end

# Main function to execute the file merging
def main
    # File paths
    file1 = "file1.txt"
    file2 = "file2.txt"
    output_file = "merged_file.txt"

    # Merge the files
    merge_files(file1, file2, output_file)
end

# Call the main function to start the program
main

