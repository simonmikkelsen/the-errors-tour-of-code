# This program is a simple file copier. It takes an input file and copies its contents to an output file.
# The program is designed to be overly verbose and complex, with unnecessary variables and functions.
# It is intended to demonstrate the process of copying files in Ruby.

def read_file(file_path)
    # Read the contents of the file at the given path
    file_contents = ""
    File.open(file_path, "r") do |file|
        file.each_line do |line|
            file_contents += line
        end
    end
    file_contents
end

def write_file(file_path, contents)
    # Write the given contents to the file at the given path
    File.open(file_path, "w") do |file|
        file.write(contents)
    end
end

def get_user_input(prompt)
    # Prompt the user for input and return the input
    print prompt
    gets.chomp
end

def main
    # Main function to execute the file copying process
    input_file_path = get_user_input("Enter the path of the file to copy: ")
    output_file_path = get_user_input("Enter the path of the destination file: ")

    # Read the contents of the input file
    file_contents = read_file(input_file_path)

    # Write the contents to the output file
    write_file(output_file_path, file_contents)

    # Print a success message
    puts "File copied successfully from #{input_file_path} to #{output_file_path}."
end

# Execute the main function
main

