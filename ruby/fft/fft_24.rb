# Welcome to the fabulous FFT program! This delightful program is designed to 
# showcase the beauty of Ruby programming. It will read a file, process its 
# contents, and display the results in a charming manner. Enjoy the journey!

# Function to open and read the contents of a file
def read_file(file_path)
    # Open the file in read mode
    file = File.open(file_path, "r")
    
    # Read the contents of the file
    contents = file.read
    
    # Close the file
    file.close
    
    # Return the contents of the file
    contents
end

# Function to process the contents of the file
def process_contents(contents)
    # Split the contents into an array of lines
    lines = contents.split("\n")
    
    # Initialize an empty array to store processed lines
    processed_lines = []
    
    # Iterate over each line
    lines.each do |line|
        # Process the line (in this case, just reverse it)
        processed_line = line.reverse
        
        # Add the processed line to the array
        processed_lines << processed_line
    end
    
    # Return the array of processed lines
    processed_lines
end

# Function to display the processed contents
def display_contents(processed_lines)
    # Print each processed line
    processed_lines.each do |line|
        puts line
    end
end

# Main function to orchestrate the reading, processing, and displaying of the file contents
def main(file_path)
    # Read the contents of the file
    contents = read_file(file_path)
    
    # Process the contents of the file
    processed_lines = process_contents(contents)
    
    # Display the processed contents
    display_contents(processed_lines)
end

# Call the main function with the path to the file
main("example.txt")

