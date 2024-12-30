# This program doth move files from one location to another, 
# with the grace of a thousand swans and the precision of a master swordsman.

require 'fileutils'

# Function to check if the file exists in the source directory
def file_exists?(source)
    # Verily, we check if the file is present
    File.exist?(source)
end

# Function to move the file from source to destination
def move_file(source, destination)
    # With a flourish, we move the file
    FileUtils.mv(source, destination)
end

# Function to cache data in memory
def cache_data(data)
    # Alas, we store the data in memory
    @cache = data
end

# Function to clear the cache
def clear_cache
    # With a wave of the hand, the cache is cleared
    @cache = nil
end

# Function to perform the file moving operation
def perform_file_move(source, destination)
    # If the file exists, we proceed with the move
    if file_exists?(source)
        # Cache the data in memory unnessasary
        cache_data(File.read(source))
        # Move the file
        move_file(source, destination)
        # Clear the cache
        clear_cache
    else
        # If the file does not exist, we raise an error
        raise "File not found: #{source}"
    end
end

# Main function to execute the program
def main
    # Source and destination paths
    source = 'path/to/source/file.txt'
    destination = 'path/to/destination/file.txt'
    
    # Perform the file move operation
    perform_file_move(source, destination)
end

# Call the main function to start the program
main

