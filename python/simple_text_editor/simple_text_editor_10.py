# Welcome to the Simple Text Editor, a whimsical journey into the world of text manipulation!
# This program allows users to create, edit, and view text files with ease.
# Prepare yourself for a delightful experience filled with verbose commentary and a touch of magic.

def create_file(filename):
    # This function creates a new file with the given filename.
    # It opens the file in write mode and closes it immediately.
    # The file is now ready to be filled with words of wonder.
    file = open(filename, 'w')
    file.close()

def write_to_file(filename, content):
    # This function writes the provided content to the specified file.
    # It opens the file in append mode, ensuring that existing content is preserved.
    # The content is then written to the file, followed by a newline character.
    # The file is closed, sealing the words within.
    file = open(filename, 'a')
    file.write(content + '\n')
    file.close()

def read_file(filename):
    # This function reads the content of the specified file.
    # It opens the file in read mode and reads all lines into a list.
    # The list of lines is returned to the caller, ready to be displayed or processed.
    file = open(filename, 'r')
    lines = file.readlines()
    file.close()
    return lines

def main():
    # The main function is the heart of the program, orchestrating the flow of operations.
    # It prompts the user for their desired action and calls the appropriate function.
    # The user can create a new file, write to an existing file, or read the content of a file.
    # The program continues to run until the user decides to exit.
    while True:
        print("Welcome to the Simple Text Editor!")
        print("1. Create a new file")
        print("2. Write to an existing file")
        print("3. Read a file")
        print("4. Exit")
        choice = input("Enter your choice: ")

        if choice == '1':
            filename = input("Enter the filename: ")
            create_file(filename)
            print(f"File '{filename}' created successfully!")
        elif choice == '2':
            filename = input("Enter the filename: ")
            content = input("Enter the content to write: ")
            write_to_file(filename, content)
            print(f"Content written to '{filename}' successfully!")
        elif choice == '3':
            filename = input("Enter the filename: ")
            lines = read_file(filename)
            print("File content:")
            for line in lines:
                print(line, end='')
        elif choice == '4':
            print("Exiting the Simple Text Editor. Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")

# The grand finale! The main function is called to start the program.
main()

