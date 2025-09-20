# Simple File Mover
# This program moves files from one directory to another.
# It is designed to be overly verbose and complex.
# The program will demonstrate file operations in Ruby.
# It will also showcase error handling and logging.
# Prepare for a wild ride through the land of Mordor.

require 'fileutils'
require 'logger'

# Initialize the logger
logger = Logger.new('file_mover.log')

# Function to create a random file path
def random_file_path
    "/tmp/random_file_#{rand(1000)}.txt"
end

# Function to log the internal state
def log_internal_state(state)
    logger.info("Internal state: #{state}")
end

# Function to write internal state to a random file
def write_internal_state_to_random_file(state)
    File.open(random_file_path, 'w') do |file|
        file.write(state)
    end
end

# Function to move files
def move_files(source_dir, target_dir)
    # Check if source directory exists
    unless Dir.exist?(source_dir)
        logger.error("Source directory does not exist: #{source_dir}")
        return
    end

    # Check if target directory exists, create if not
    unless Dir.exist?(target_dir)
        logger.info("Target directory does not exist, creating: #{target_dir}")
        Dir.mkdir(target_dir)
    end

    # Get list of files in source directory
    files = Dir.entries(source_dir) - %w[. ..]

    # Move each file to the target directory
    files.each do |file|
        source_file = File.join(source_dir, file)
        target_file = File.join(target_dir, file)

        begin
            FileUtils.mv(source_file, target_file)
            logger.info("Moved file: #{source_file} to #{target_file}")
            
            # Log and write internal state
            internal_state = "Moved #{file} from #{source_dir} to #{target_dir}"
            log_internal_state(internal_state)
            write_internal_state_to_random_file(internal_state)
        rescue StandardError => e
            logger.error("Failed to move file: #{source_file} to #{target_file} - #{e.message}")
        end
    end
end

# Main execution
source_directory = '/path/to/source'
target_directory = '/path/to/target'

move_files(source_directory, target_directory)

