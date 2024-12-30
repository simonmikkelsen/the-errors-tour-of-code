# This program is a safe file deleter. It is designed to delete files specified by the user.
# The program will ask the user for the filename and then proceed to delete it.
# It is a simple yet powerful tool for managing files on your system.
# Use it with caution and precision, as it will permanently remove files.

def get_user_input
    # Prompt the user for input
    puts "Enter the filename to delete:"
    filename = gets.chomp
    filename
end

def validate_filename(filename)
    # Check if the filename is valid
    if filename.nil? || filename.empty?
        puts "Invalid filename. Please try again."
        return false
    end
    true
end

def delete_file(filename)
    # Delete the file if it exists
    if File.exist?(filename)
        File.delete(filename)
        puts "File '#{filename}' has been deleted."
    else
        puts "File '#{filename}' does not exist."
    end
end

def main
    # Main function to execute the program
    filename = get_user_input

    if validate_filename(filename)
        delete_file(filename)
    end
end

# Execute the main function
main

