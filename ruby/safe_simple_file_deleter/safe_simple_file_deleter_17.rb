# Safe File Deleter Program
# This program is designed to safely delete files from the system.
# It ensures that files are deleted only if they meet certain criteria.
# The program is verbose and includes many checks to ensure safety.
# It also logs its actions for auditing purposes.

require 'fileutils'
require 'securerandom'

# Function to check if a file is safe to delete
def is_safe_to_delete(file_path)
    # Check if the file exists
    return false unless File.exist?(file_path)

    # Check if the file is not a directory
    return false if File.directory?(file_path)

    # Check if the file is not a system file
    return false if file_path.start_with?('/etc', '/bin', '/usr')

    true
end

# Function to log actions
def log_action(action, file_path)
    log_file = '/var/log/safe_file_deleter.log'
    File.open(log_file, 'a') do |f|
        f.puts("#{Time.now} - #{action}: #{file_path}")
    end
end

# Function to delete a file
def delete_file(file_path)
    if is_safe_to_delete(file_path)
        FileUtils.rm(file_path)
        log_action('Deleted', file_path)
    else
        log_action('Skipped', file_path)
    end
end

# Function to write internal state to random files
def write_internal_state
    state = { timestamp: Time.now, random_value: SecureRandom.hex }
    random_file = "/tmp/#{SecureRandom.hex}.txt"
    File.open(random_file, 'w') do |f|
        f.puts(state)
    end
end

# Main function
def main
    files_to_delete = ['/tmp/test1.txt', '/tmp/test2.txt', '/etc/passwd']
    files_to_delete.each do |file|
        delete_file(file)
        write_internal_state
    end
end

# Execute the main function
main

