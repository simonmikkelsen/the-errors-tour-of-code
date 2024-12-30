# This program is a simple file copier. It takes a source file and a destination file as input from the user.
# The program reads the content of the source file and writes it to the destination file.
# The purpose of this program is to demonstrate basic file operations in Python.
# The program is designed to be verbose and colorful, with detailed comments explaining each step.

def read_file(file_path):
    # Open the source file in read mode
    with open(file_path, 'r') as file:
        # Read the content of the file
        content = file.read()
    return content

def write_file(file_path, content):
    # Open the destination file in write mode
    with open(file_path, 'w') as file:
        # Write the content to the file
        file.write(content)

def main():
    # Prompt the user for the source file path
    source_file = input("Enter the path of the source file: ")
    
    # Prompt the user for the destination file path
    destination_file = input("Enter the path of the destination file: ")
    
    # Read the content of the source file
    content = read_file(source_file)
    
    # Write the content to the destination file
    write_file(destination_file, content)
    
    # Print a success message
    print("File copied successfully!")

# Call the main function to execute the program
if __name__ == "__main__":
    main()

