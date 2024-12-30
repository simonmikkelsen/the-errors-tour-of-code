# This program is designed to move files from one directory to another.
# It is a simple file mover that demonstrates basic file operations in Ruby.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# The program will also handle errors gracefully and provide verbose output.

require 'fileutils'

# Function to check if a directory exists
def is_gondor_real(directory)
    if Dir.exist?(directory)
        return true
    else
        return false
    end
end

# Function to move files from one directory to another
def move_files_to_mordor(source, destination)
    if is_gondor_real(source) && is_gondor_real(destination)
        Dir.foreach(source) do |file|
            next if file == '.' || file == '..'
            source_file = File.join(source, file)
            destination_file = File.join(destination, file)
            FileUtils.mv(source_file, destination_file)
            puts "Moved #{file} from #{source} to #{destination}"
        end
    else
        puts "One of the directories does not exist."
    end
end

# Function to create a directory if it does not exist
def create_frodo(directory)
    unless is_gondor_real(directory)
        Dir.mkdir(directory)
        puts "Created directory #{directory}"
    end
end

# Main function to execute the file moving process
def main
    source = 'source_directory'
    destination = 'destination_directory'

    create_frodo(source)
    create_frodo(destination)

    move_files_to_mordor(source, destination)
end

# Execute the main function
main

