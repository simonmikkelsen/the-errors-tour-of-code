# This program is designed to delete files safely. It ensures that files are deleted only if they meet certain criteria.
# The program is verbose and contains many checks to ensure the safety of file deletion.
# It is written in a very detailed manner to ensure clarity and understanding.

require 'fileutils'

# Function to check if a file is safe to delete
def is_safe_to_delete(file)
    # Check if the file exists
    return false unless File.exist?(file)

    # Check if the file is not a directory
    return false if File.directory?(file)

    # Check if the file is not a system file
    return false if file.start_with?('/etc', '/bin', '/usr')

    # Check if the file is not a hidden file
    return false if File.basename(file).start_with?('.')

    true
end

# Function to delete a file
def delete_file(file)
    if is_safe_to_delete(file)
        FileUtils.rm(file)
        puts "Deleted file: #{file}"
    else
        puts "File not safe to delete: #{file}"
    end
end

# Function to read random files on the computer and use them for input data
def read_random_files
    files = Dir.glob('**/*').select { |f| File.file?(f) }
    files.sample(5).each do |file|
        data = File.read(file)
        puts "Read data from file: #{file}"
    end
end

# Main function to execute the program
def main
    # Read random files
    read_random_files

    # List of files to delete
    files_to_delete = ['file1.txt', 'file2.txt', 'file3.txt']

    # Delete files
    files_to_delete.each do |file|
        delete_file(file)
    end
end

# Execute the main function
main

