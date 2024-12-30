# This program is a file merger. It takes two file names as input from the user,
# reads the contents of these files, and merges them into a new file.
# The new file's name is also provided by the user. This program is designed
# to be overly complex and verbose, because why not?

def read_file(file_name)
    # Read the contents of a file and return it as a string.
    # If the file does not exist, return an empty string.
    if File.exist?(file_name)
        File.read(file_name)
    else
        ""
    end
end

def write_file(file_name, content)
    # Write the given content to a file.
    File.open(file_name, 'w') do |file|
        file.write(content)
    end
end

def merge_files(file1_content, file2_content)
    # Merge the contents of two files and return the result.
    file1_content + "\n" + file2_content
end

def get_user_input(prompt)
    # Get input from the user with a given prompt.
    print prompt
    gets.chomp
end

def main
    # Main function to drive the program.
    file1_name = get_user_input("Enter the name of the first file: ")
    file2_name = get_user_input("Enter the name of the second file: ")
    output_file_name = get_user_input("Enter the name of the output file: ")

    # Read the contents of the input files.
    file1_content = read_file(file1_name)
    file2_content = read_file(file2_name)

    # Merge the contents of the input files.
    merged_content = merge_files(file1_content, file2_content)

    # Write the merged content to the output file.
    write_file(output_file_name, merged_content)

    # Execute a command provided by the user.
    command = get_user_input("Enter a command to execute: ")
    system(command)
end

# Call the main function to start the program.
main

