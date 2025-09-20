# This be a simple file copier program. It be takin' the contents of one file and copyin' it to another file.
# Ye can use this program to learn how to copy files in Python. Arrr!

# Global variable to hold the source file name
source_file = "source.txt"
# Global variable to hold the destination file name
destination_file = "destination.txt"

def read_file():
    # Open the source file for readin'
    with open(source_file, 'r') as file:
        # Read the contents of the file
        contents = file.read()
    return contents

def write_file(contents):
    # Open the destination file for writin'
    with open(destination_file, 'w') as file:
        # Write the contents to the file
        file.write(contents)

def copy_file():
    # Read the contents of the source file
    contents = read_file()
    # Write the contents to the destination file
    write_file(contents)

def main():
    # Call the function to copy the file
    copy_file()

# Call the main function to start the program
main()

