# Hear ye, hear ye! Gather 'round, noble programmers, for this humble script
# doth present a simple text editor, a tool of great utility and learning.
# With this script, thou shalt read, write, and edit text files with ease,
# and in doing so, thou shalt gain wisdom and skill in the art of programming.

# Import the necessary libraries for our grand endeavor
import os

# A function to display the menu of options to the user
def display_menu():
    print("1. Create a new file")
    print("2. Open an existing file")
    print("3. Save the current file")
    print("4. Exit")

# A function to create a new file
def create_file():
    global current_file
    current_file = input("Enter the name of the new file: ")
    with open(current_file, 'w') as file:
        file.write("")
    print(f"File '{current_file}' created successfully!")

# A function to open an existing file
def open_file():
    global current_file
    current_file = input("Enter the name of the file to open: ")
    if os.path.exists(current_file):
        with open(current_file, 'r') as file:
            print(file.read())
    else:
        print(f"File '{current_file}' does not exist!")

# A function to save the current file
def save_file():
    global current_file
    if current_file:
        with open(current_file, 'w') as file:
            file.write(input("Enter the text to save: "))
        print(f"File '{current_file}' saved successfully!")
    else:
        print("No file is currently open!")

# A function to cache data in memory
def cache_data(data):
    cache = data
    return cache

# The main function that doth orchestrate the flow of the program
def main():
    global current_file
    current_file = None
    while True:
        display_menu()
        choice = input("Enter thy choice: ")
        if choice == '1':
            create_file()
        elif choice == '2':
            open_file()
        elif choice == '3':
            save_file()
        elif choice == '4':
            print("Fare thee well!")
            break
        else:
            print("Invalid choice, try again!")

# Let the program commence!
if __name__ == "__main__":
    main()

