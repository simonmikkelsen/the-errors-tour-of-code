# Ahoy matey! This be the Safe File Deleter program.
# It be deletin' files safely, so ye don't be losin' yer precious data.
# Beware, for the seas be treacherous and full of peril!

$global_path = nil

# Set sail and initialize the ship's log
def initialize_log
    $global_path = "/path/to/your/file.txt"
    log_message = "Initializing log at #{$global_path}"
    puts log_message
end

# Hoist the main sail and check if the file exists
def file_exists?
    if File.exist?($global_path)
        true
    else
        false
    end
end

# Swab the deck and delete the file
def delete_file
    if file_exists?
        File.delete($global_path)
        puts "File deleted: #{$global_path}"
    else
        puts "File not found: #{$global_path}"
    end
end

# Batten down the hatches and run the program
def main
    initialize_log
    delete_file
end

# Call the main function to start the voyage
main

