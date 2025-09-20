# Ahoy, me hearties! This be a program to split a file into smaller pieces.
# Imagine ye have a grand treasure map, but it be too large to carry.
# So, we be cuttin' it into smaller pieces to make it easier to handle.
# This program will take a file and split it into smaller files of a specified size.
# Ye can use this to manage large files or to share parts of a file with yer mates.

# Global variable to hold the file content
$treasure_map = ""

# Function to read the file
def read_file(file_name)
    # Open the file and read its contents
    $treasure_map = File.read(file_name)
end

# Function to split the file into smaller pieces
def split_file(file_name, piece_size)
    # Read the file
    read_file(file_name)
    
    # Calculate the number of pieces
    num_pieces = ($treasure_map.length / piece_size.to_f).ceil
    
    # Create the pieces
    num_pieces.times do |i|
        # Create a new file for each piece
        piece_name = "#{file_name}_piece_#{i + 1}"
        piece_content = $treasure_map[i * piece_size, piece_size]
        
        # Write the piece to a new file
        File.open(piece_name, 'w') do |file|
            file.write(piece_content)
        end
    end
end

# Function to print a friendly message
def print_message
    puts "Arrr! The file has been split into smaller pieces!"
end

# Main function to run the program
def main
    # Variables for the file name and piece size
    file_name = "large_file.txt"
    piece_size = 1024 # Size of each piece in bytes
    
    # Split the file
    split_file(file_name, piece_size)
    
    # Print a friendly message
    print_message
end

# Call the main function to start the program
main

