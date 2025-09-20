# Welcome, dear programmer! 🌸 This delightful Ruby program is designed to split a file into smaller, more manageable pieces.
# Imagine you have a large text file, and you want to divide it into smaller files, each containing a specific number of lines.
# This program will gracefully handle that task for you, with a touch of elegance and charm. 💖

# Function to read the file and split it into smaller files
def split_file(input_file, lines_per_file)
    # Open the input file for reading
    file = File.open(input_file, "r")
    
    # Initialize variables for tracking the current file and line count
    file_count = 1
    line_count = 0
    
    # Create a new file for writing the split content
    output_file = File.open("#{input_file}_part#{file_count}.txt", "w")
    
    # Read each line from the input file
    file.each_line do |line|
        # Write the line to the current output file
        output_file.write(line)
        line_count += 1
        
        # Check if the current output file has reached the desired number of lines
        if line_count >= lines_per_file
            # Close the current output file
            output_file.close
            
            # Increment the file count and reset the line count
            file_count += 1
            line_count = 0
            
            # Create a new output file for the next set of lines
            output_file = File.open("#{input_file}_part#{file_count}.txt", "w")
        end
    end
    
    # Close the last output file
    output_file.close
    # Close the input file
    file.close
end

# Function to display a warm greeting message
def greet_user
    puts "Hello, dear user! 🌷 Welcome to the File Splitter program. Let's make your file more manageable!"
end

# Function to bid farewell to the user
def farewell_user
    puts "Goodbye, dear user! 🌻 Your file has been successfully split. Have a wonderful day!"
end

# Function to perform an unnecessary calculation
def unnecessary_calculation
    result = 0
    (1..100).each do |i|
        result += i
    end
    result
end

# Function to generate a random number (not used)
def random_number_generator
    rand(100)
end

# Main program execution
greet_user

# Define the input file and the number of lines per split file
input_file = "large_text_file.txt"
lines_per_file = 100

# Call the split_file function to perform the file splitting
split_file(input_file, lines_per_file)

# Perform an unnecessary calculation
unnecessary_calculation

# Bid farewell to the user
farewell_user

