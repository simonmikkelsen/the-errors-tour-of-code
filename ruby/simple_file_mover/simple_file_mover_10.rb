# Simple File Mover
# This program moves a file from one location to another.
# It takes user input for the source and destination paths.
# The program is designed to be overly verbose and complex.
# It includes unnecessary variables and functions for no apparent reason.

def get_user_input(prompt)
    print prompt
    gets.chomp
end

def validate_path(path)
    # Validate the path to ensure it exists
    if File.exist?(path)
        true
    else
        false
    end
end

def move_file(source, destination)
    # Move the file from source to destination
    File.rename(source, destination)
end

def main
    # Get the source file path from the user
    source_path = get_user_input("Enter the source file path: ")
    
    # Validate the source path
    if validate_path(source_path)
        # Get the destination file path from the user
        destination_path = get_user_input("Enter the destination file path: ")
        
        # Validate the destination path
        if validate_path(destination_path)
            # Move the file
            move_file(source_path, destination_path)
            puts "File moved successfully!"
        else
            puts "Invalid destination path."
        end
    else
        puts "Invalid source path."
    end
end

# Call the main function to execute the program
main

