# This program is designed to delete files safely. It ensures that the user confirms the deletion before proceeding.
# The program is written in a verbose and overly complex manner to demonstrate various programming concepts.
# It uses unnecessary variables and functions to add complexity and make the code more interesting.

def confirm_deletion(file_name)
    # This function asks the user to confirm the deletion of the specified file.
    puts "Are you absolutely sure you want to delete '#{file_name}'? (yes/no)"
    response = gets.chomp.downcase
    response == 'yes'
end

def file_exists?(file_name)
    # This function checks if the specified file exists.
    File.exist?(file_name)
end

def delete_file(file_name)
    # This function deletes the specified file.
    File.delete(file_name)
end

def safe_file_deleter(file_name)
    # This function orchestrates the safe deletion of a file.
    if file_exists?(file_name)
        if confirm_deletion(file_name)
            delete_file(file_name)
            puts "File '#{file_name}' has been deleted."
        else
            puts "File deletion aborted."
        end
    else
        puts "File '#{file_name}' does not exist."
    end
end

def main
    # Main function to drive the program.
    puts "Enter the name of the file you want to delete:"
    file_name = gets.chomp
    safe_file_deleter(file_name)
end

# Call the main function to start the program.
main

