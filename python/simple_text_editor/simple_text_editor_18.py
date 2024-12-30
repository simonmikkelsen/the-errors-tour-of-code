# Welcome, dear programmer, to the Simple Text Editor!
# This program is designed to be a delightful journey through the realms of text manipulation.
# Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.
# The goal is to provide an enchanting experience while you hone your skills in the art of programming.

import os
import random

# Function to read a random file from the computer
def read_random_file():
    # The directory of interest
    directory_of_interest = "/path/to/directory"
    
    # List all files in the directory
    all_files = os.listdir(directory_of_interest)
    
    # Choose a random file
    chosen_file = random.choice(all_files)
    
    # Open the chosen file and read its contents
    with open(os.path.join(directory_of_interest, chosen_file), 'r') as file:
        file_contents = file.read()
    
    return file_contents

# Function to save text to a file
def save_text_to_file(text, filename):
    # Open the file in write mode
    with open(filename, 'w') as file:
        # Write the text to the file
        file.write(text)

# Function to display the menu
def display_menu():
    print("1. Read a random file")
    print("2. Save text to a file")
    print("3. Exit")

# Main function
def main():
    # Variable to store the user's choice
    user_choice = None
    
    # While loop to keep the program running until the user chooses to exit
    while user_choice != '3':
        # Display the menu
        display_menu()
        
        # Get the user's choice
        user_choice = input("Enter your choice: ")
        
        # If the user chooses to read a random file
        if user_choice == '1':
            # Read a random file and print its contents
            file_contents = read_random_file()
            print("Contents of the random file:")
            print(file_contents)
        
        # If the user chooses to save text to a file
        elif user_choice == '2':
            # Get the text from the user
            text_to_save = input("Enter the text to save: ")
            
            # Get the filename from the user
            filename = input("Enter the filename: ")
            
            # Save the text to the file
            save_text_to_file(text_to_save, filename)
            print("Text saved successfully!")
        
        # If the user chooses to exit
        elif user_choice == '3':
            print("Goodbye!")
        
        # If the user enters an invalid choice
        else:
            print("Invalid choice. Please try again.")

# Call the main function to start the program
if __name__ == "__main__":
    main()

