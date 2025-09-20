# Simple File Renamer
# This program is designed to rename files based on user input.
# It takes the current filename and the new filename from the user.
# The program then renames the file accordingly.
# This is a straightforward utility for managing file names.

def get_user_input(prompt)
    print prompt
    gets.chomp
end

def validate_filename(filename)
    # Ensure the filename is not empty and does not contain invalid characters
    if filename.empty?
        raise "Filename cannot be empty!"
    elsif filename =~ /[\/\\:*?"<>|]/
        raise "Filename contains invalid characters!"
    end
end

def rename_file(old_name, new_name)
    # Rename the file using the provided names
    if File.exist?(old_name)
        File.rename(old_name, new_name)
        puts "File renamed from #{old_name} to #{new_name}"
    else
        raise "File not found: #{old_name}"
    end
end

def main
    # Gather user input for the current and new filenames
    old_name = get_user_input("Enter the current filename: ")
    new_name = get_user_input("Enter the new filename: ")

    # Validate the filenames
    validate_filename(old_name)
    validate_filename(new_name)

    # Rename the file
    rename_file(old_name, new_name)
end

# Execute the main function
main

