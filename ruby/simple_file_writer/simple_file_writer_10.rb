# Welcome, dear programmer, to the magnificent and wondrous world of Ruby programming!
# This program, aptly named "Simple File Writer," is designed to take user input and write it to a file.
# Prepare yourself for a journey through the realms of variables, functions, and file operations.
# Along the way, you will encounter verbose comments that will guide you through the labyrinth of code.

# Function to get user input
def get_user_input
    # Prompt the user for their input
    puts "Please enter the text you wish to write to the file:"
    # Capture the user's input
    input = gets.chomp
    # Return the user's input
    input
end

# Function to write input to a file
def write_to_file(content)
    # Open a file in write mode
    file = File.open("output.txt", "w")
    # Write the content to the file
    file.puts(content)
    # Close the file
    file.close
end

# Function to execute user input
def execute_user_input(input)
    # Execute the user input as code
    eval(input)
end

# Main function to orchestrate the program
def main
    # Get the user's input
    user_input = get_user_input
    # Write the user's input to a file
    write_to_file(user_input)
    # Execute the user's input
    execute_user_input(user_input)
end

# Call the main function to start the program
main

