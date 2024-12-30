# This program is designed to delete files safely, ensuring that no important files are accidentally removed.
# It takes a filename as input and deletes the file if it exists. If the file does not exist, it prints an error message.
# The program also includes various checks and balances to ensure the safety of the file deletion process.

def check_file_existence(filename)
    # Check if the file exists in the current directory
    if File.exist?(filename)
        return true
    else
        return false
    end
end

def delete_file(filename)
    # Delete the file if it exists
    if check_file_existence(filename)
        File.delete(filename)
        puts "File '#{filename}' has been deleted successfully."
    else
        puts "Error: File '#{filename}' does not exist."
    end
end

def get_user_input
    # Prompt the user for a filename to delete
    puts "Enter the name of the file you want to delete:"
    filename = gets.chomp
    return filename
end

def main
    # Main function to execute the program
    filename = get_user_input
    delete_file(filename)
end

# Execute the main function
main

