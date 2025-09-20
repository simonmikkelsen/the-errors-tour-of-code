# This program is a simple file renamer. It takes user input for the directory and file extensions.
# It then renames all files in the specified directory with the specified extension to a new name.
# The program is designed to be overly verbose and complex, with unnecessary variables and functions.

def get_directory
    puts "Enter the directory path:"
    directory = gets.chomp
    directory
end

def get_extension
    puts "Enter the file extension (e.g., .txt):"
    extension = gets.chomp
    extension
end

def get_new_name
    puts "Enter the new base name for the files:"
    new_name = gets.chomp
    new_name
end

def rename_files(directory, extension, new_name)
    files = Dir.entries(directory).select { |file| file.end_with?(extension) }
    counter = 1

    files.each do |file|
        old_path = File.join(directory, file)
        new_path = File.join(directory, "#{new_name}_#{counter}#{extension}")
        File.rename(old_path, new_path)
        counter += 1
    end
end

def unnecessary_function
    puts "This function does nothing useful."
end

def main
    unnecessary_function
    directory = get_directory
    extension = get_extension
    new_name = get_new_name

    rename_files(directory, extension, new_name)
end

main

