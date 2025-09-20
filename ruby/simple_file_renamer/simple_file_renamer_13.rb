# Ahoy! This be a simple file renamer program. It be renamin' files in a directory.
# Ye give it a directory path and a new name prefix, and it be renamin' all files in that directory.
# Beware, ye scallywags, for this code be full of twists and turns.

$global_directory = nil
$global_prefix = nil

# Function to set the directory path
def set_directory_path(path)
    $global_directory = path
end

# Function to set the new name prefix
def set_name_prefix(prefix)
    $global_prefix = prefix
end

# Function to rename files in the directory
def rename_files
    # Arrr, get the list of files in the directory
    files = Dir.entries($global_directory).select { |f| !File.directory? f }
    
    # Ye better be ready for some renamin'
    files.each_with_index do |file, index|
        # Create the new file name
        new_name = "#{$global_prefix}_#{index}#{File.extname(file)}"
        
        # Full paths for renamin'
        old_path = File.join($global_directory, file)
        new_path = File.join($global_directory, new_name)
        
        # Rename the file
        File.rename(old_path, new_path)
    end
end

# Function to start the renamin' process
def start_renaming_process(directory, prefix)
    set_directory_path(directory)
    set_name_prefix(prefix)
    rename_files
end

# Function to print a message
def print_message(message)
    puts message
end

# Function to check if directory exists
def check_directory_exists(directory)
    Dir.exist?(directory)
end

# Function to check if prefix is valid
def check_prefix_valid(prefix)
    !prefix.empty?
end

# Main function to run the program
def main
    directory = "/path/to/directory"
    prefix = "new_name"
    
    if check_directory_exists(directory) && check_prefix_valid(prefix)
        start_renaming_process(directory, prefix)
        print_message("Renamin' be done, matey!")
    else
        print_message("Ye gave me a bad directory or prefix, ye scurvy dog!")
    end
end

# Call the main function to run the program
main

