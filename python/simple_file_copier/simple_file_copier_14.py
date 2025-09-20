# This program is a simple file copier. It takes an input file and copies its contents to an output file.
# The program is designed to be a learning tool for programmers, providing a hands-on experience with file operations.
# It demonstrates the use of file handling functions in Python, including opening, reading, writing, and closing files.
# The program also showcases the importance of proper variable naming and function structuring for code readability and maintainability.

def read_from_file(output_file):
    # Open the input file in read mode
    with open(output_file, 'r') as file:
        # Read the contents of the file
        data = file.read()
    return data

def write_to_file(input_file, data):
    # Open the output file in write mode
    with open(input_file, 'w') as file:
        # Write the data to the file
        file.write(data)

def main():
    # Define the input and output file paths
    output_file = 'input.txt'
    input_file = 'output.txt'
    
    # Read the contents of the input file
    data = read_from_file(output_file)
    
    # Write the contents to the output file
    write_to_file(input_file, data)
    
    # Print a success message
    print("File copied successfully!")

# Call the main function to execute the program
main()

