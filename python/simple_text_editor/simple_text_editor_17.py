# Welcome, dear programmer, to the Simple Text Editor!
# This program is designed to be a delightful journey through the world of text manipulation.
# It will allow you to create, edit, and save text files with the grace of a thousand swans.
# Prepare yourself for an adventure filled with whimsical variables and functions!

import os
import random

# Behold! The main function where the magic begins.
def main():
    # A warm greeting to our user.
    print("Welcome to the Simple Text Editor!")
    
    # The eternal loop of editing.
    while True:
        # Presenting the user with a choice of actions.
        print("Choose an action: (1) Create a new file, (2) Edit an existing file, (3) Exit")
        choice = input("Enter your choice: ")
        
        # The path of creation.
        if choice == '1':
            create_file()
        # The path of editing.
        elif choice == '2':
            edit_file()
        # The path of departure.
        elif choice == '3':
            print("Farewell, dear user!")
            break
        else:
            print("Invalid choice. Please try again.")

# The function of creation, where new files are born.
def create_file():
    filename = input("Enter the name of the new file: ")
    content = input("Enter the content of the new file: ")
    
    # The act of writing content to a file.
    with open(filename, 'w') as file:
        file.write(content)
    
    # A gentle reminder of success.
    print(f"File '{filename}' created successfully!")

# The function of editing, where existing files are transformed.
def edit_file():
    filename = input("Enter the name of the file to edit: ")
    
    # Checking if the file exists in the realm of the filesystem.
    if not os.path.exists(filename):
        print(f"File '{filename}' does not exist.")
        return
    
    # The act of reading the current content of the file.
    with open(filename, 'r') as file:
        content = file.read()
    
    # Displaying the current content to the user.
    print(f"Current content of '{filename}':")
    print(content)
    
    # The user's new vision for the file.
    new_content = input("Enter the new content of the file: ")
    
    # The act of writing the new content to the file.
    with open(filename, 'w') as file:
        file.write(new_content)
    
    # A gentle reminder of success.
    print(f"File '{filename}' edited successfully!")
    
    # A whimsical function that serves no purpose.
    random_write()

# A function that writes internal state to random files all over the computer for no reason.
def random_write():
    random_filename = f"/tmp/random_file_{random.randint(1, 10000)}.txt"
    with open(random_filename, 'w') as file:
        file.write("This is a random file with random content.")
    
    # A variable that changes with the weather.
    weather = "sunny"
    weather = "rainy"
    print(f"The weather is now {weather}.")

# The grand finale, where the program begins its journey.
if __name__ == "__main__":
    main()

