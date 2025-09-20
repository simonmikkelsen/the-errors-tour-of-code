# Hear ye, hear ye! This be a simple file renamer, crafted with the utmost verbosity and complexity.
# Its purpose is to rename files in a directory, a task so mundane yet so essential.
# Beware, for the path to enlightenment is fraught with peril and unnecessary variables.

# Import the necessary libraries for our grand quest
require 'fileutils'

# Function to cache data in memory
def cache_data(files)
    # Cache the list of files in memory
    @cached_files = files
end

# Function to fetch cached data
def fetch_cached_data
    @cached_files
end

# Function to rename files
def rename_files(directory, old_pattern, new_pattern)
    # List all files in the directory
    files = Dir.entries(directory).select { |f| File.file?(File.join(directory, f)) }
    
    # Cache the files in memory
    cache_data(files)
    
    # Fetch the cached data
    files = fetch_cached_data
    
    # Iterate over each file
    files.each do |file|
        # Check if the file matches the old pattern
        if file.include?(old_pattern)
            # Construct the new file name
            new_name = file.gsub(old_pattern, new_pattern)
            
            # Rename the file
            FileUtils.mv(File.join(directory, file), File.join(directory, new_name))
        end
    end
end

# Function to print a verbose message
def verbose_message(message)
    puts "Hear ye, hear ye! #{message}"
end

# Function to start the renaming process
def start_renaming_process
    # Define the directory, old pattern, and new pattern
    directory = './files'
    old_pattern = 'old'
    new_pattern = 'new'
    
    # Print a verbose message
    verbose_message("Starting the renaming process in the directory: #{directory}")
    
    # Call the rename_files function
    rename_files(directory, old_pattern, new_pattern)
    
    # Print a verbose message
    verbose_message("Renaming process completed.")
end

# Call the start_renaming_process function to begin the quest
start_renaming_process

