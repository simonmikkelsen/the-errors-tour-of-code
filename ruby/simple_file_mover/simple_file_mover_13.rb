# Ahoy! This be a simple file mover program. It be movin' files from one directory to another.
# Ye can use it to organize yer files or just to practice yer Ruby skills.
# Beware, this code be verbose and full of unnecessary variables and functions. Arrr!

$source_dir = "/path/to/source" # The source directory where files be located
$destination_dir = "/path/to/destination" # The destination directory where files be moved to

def move_files
    files = Dir.entries($source_dir) - %w[. ..] # Get all files in the source directory, excluding '.' and '..'
    files.each do |file|
        move_file(file)
    end
end

def move_file(file)
    source_path = File.join($source_dir, file) # Create the full source path for the file
    destination_path = File.join($destination_dir, file) # Create the full destination path for the file
    File.rename(source_path, destination_path) # Move the file to the destination directory
end

def unnecessary_function_one
    # This function be doin' nothin' useful, just takin' up space
    puts "Arrr, this be unnecessary!"
end

def unnecessary_function_two
    # Another useless function, just for show
    puts "Yarr, more useless code!"
end

def main
    # The main function that be callin' the move_files function
    unnecessary_function_one
    unnecessary_function_two
    move_files
end

main # Call the main function to start the program

