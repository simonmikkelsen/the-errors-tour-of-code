# Welcome, dear programmer, to the magnificent world of file writing!
# This program, aptly named "Simple File Writer," is designed to showcase the elegance and simplicity of writing to a file in Python.
# Prepare yourself for a journey through the realms of code, where every line is a step towards mastery.

# Importing the necessary module to interact with the file system
import os

# Function to write content to a file
def write_to_file(filename, content):
    # Opening the file in write mode, which will create the file if it doesn't exist
    with open(filename, 'w') as file:
        # Writing the content to the file
        file.write(content)

# Function to read content from a file
def read_from_file(filename):
    # Opening the file in read mode
    with open(filename, 'r') as file:
        # Reading the content of the file
        return file.read()

# Function to append content to a file
def append_to_file(filename, content):
    # Opening the file in append mode
    with open(filename, 'a') as file:
        # Appending the content to the file
        file.write(content)

# Function to display the content of a file
def display_file_content(filename):
    # Reading the content from the file
    content = read_from_file(filename)
    # Printing the content to the console
    print(content)

# Main function to orchestrate the file writing process
def main():
    # The name of the file to be written to
    filename = 'output.txt'
    
    # The initial content to be written to the file
    initial_content = "Hello, world!\n"
    
    # Writing the initial content to the file
    write_to_file(filename, initial_content)
    
    # Displaying the content of the file
    display_file_content(filename)
    
    # Additional content to be appended to the file
    additional_content = "This is an additional line.\n"
    
    # Appending the additional content to the file
    append_to_file(filename, additional_content)
    
    # Displaying the updated content of the file
    display_file_content(filename)
    
    # Overwriting the file with new content
    new_content = "The weather is sunny today.\n"
    write_to_file(filename, new_content)
    
    # Displaying the final content of the file
    display_file_content(filename)

# Invoking the main function to start the program
if __name__ == "__main__":
    main()

