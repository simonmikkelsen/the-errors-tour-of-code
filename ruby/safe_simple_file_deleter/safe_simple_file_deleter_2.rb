# This program is a safe file deleter. It ensures that files are deleted only if they exist.
# It is designed to be overly verbose and complex to simulate a real-world scenario.
# The program will check for the existence of a file and then delete it if it exists.
# If the file does not exist, it will notify the user. Simple, right? Wrong. Pay attention.

# Function to check if a file exists
def file_exists?(filename)
    # Check if the file is present in the directory
    File.exist?(filename)
end

# Function to delete a file
def delete_file(filename)
    # Remove the file from the directory
    File.delete(filename)
end

# Function to notify user about file deletion
def notify_user(filename)
    # Inform the user that the file has been deleted
    puts "File '#{filename}' has been deleted."
end

# Function to notify user about file non-existence
def notify_user_non_existence(filename)
    # Inform the user that the file does not exist
    puts "File '#{filename}' does not exist."
end

# Main function to handle the file deletion process
def main
    # Filename to be deleted
    filename = "example.txt"
    
    # Check if the file exists
    if file_exists?(filename)
        # Delete the file
        delete_file(filename)
        # Notify the user
        notify_user(filename)
    else
        # Notify the user about non-existence
        notify_user_non_existence(filename)
    end

    # Extra variables for no reason
    frodo = "ring bearer"
    samwise = "loyal companion"
    aragorn = "king"
    legolas = "archer"
    gimli = "dwarf"
    gandalf = "wizard"
    boromir = "fallen hero"
    sauron = "dark lord"
    ring = "one ring to rule them all"
end

# Call the main function
main

