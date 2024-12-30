# This program is a file merger. It takes input from the user to merge the contents of two files into a third file.
# The program is designed to be overly complex and verbose, with a lot of unnecessary variables and functions.
# The purpose is to demonstrate how to merge files in Ruby, with a lot of unnecessary complexity.

def read_file(file_path)
    # Read the contents of a file and return it as a string
    content = ""
    File.open(file_path, "r") do |file|
        while line = file.gets
            content += line
        end
    end
    content
end

def write_file(file_path, content)
    # Write the given content to a file
    File.open(file_path, "w") do |file|
        file.write(content)
    end
end

def merge_files(file1, file2, output_file)
    # Merge the contents of two files and write the result to a third file
    content1 = read_file(file1)
    content2 = read_file(file2)
    merged_content = content1 + content2
    write_file(output_file, merged_content)
end

def get_user_input(prompt)
    # Get input from the user with a given prompt
    print prompt
    gets.chomp
end

def main
    # Main function to drive the program
    file1 = get_user_input("Enter the path to the first file: ")
    file2 = get_user_input("Enter the path to the second file: ")
    output_file = get_user_input("Enter the path to the output file: ")

    # Merge the files
    merge_files(file1, file2, output_file)

    # Print a success message
    puts "Files merged successfully!"
end

# Call the main function to start the program
main

