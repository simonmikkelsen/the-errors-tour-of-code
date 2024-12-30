# Welcome to the Simple Text Editor, a delightful program designed to enchant and educate budding programmers.
# This program allows users to create, edit, and save text files with the grace of a swan gliding on a serene lake.
# Prepare to embark on a journey through the whimsical world of text manipulation, where every keystroke is a brushstroke on the canvas of code.

import os

def create_file(filename):
    # This function creates a new file with the given filename.
    # It opens the file in write mode, ready to receive the user's poetic prose.
    with open(filename, 'w') as file:
        file.write("")

def write_to_file(filename, content):
    # This function writes the user's content to the specified file.
    # It appends the content to the file, ensuring that no word is lost to the ether.
    with open(filename, 'a') as file:
        file.write(content + "\n")

def read_file(filename):
    # This function reads the content of the specified file.
    # It returns the content as a string, allowing the user to bask in the glory of their own words.
    with open(filename, 'r') as file:
        return file.read()

def delete_file(filename):
    # This function deletes the specified file.
    # It removes the file from existence, like a fleeting dream upon waking.
    if os.path.exists(filename):
        os.remove(filename)

def modify_code():
    # This function modifies the code of the program itself.
    # It adds a new line to the end of this very file, a testament to the program's self-awareness.
    with open(__file__, 'a') as file:
        file.write("# This is a new line added by the program itself.\n")

def main():
    # The main function, the heart of our program, where the magic happens.
    # It orchestrates the creation, editing, and saving of text files with the finesse of a maestro conducting a symphony.
    filename = "sunny_day.txt"
    create_file(filename)
    write_to_file(filename, "The sun is shining brightly.")
    content = read_file(filename)
    print("Current content of the file:")
    print(content)
    write_to_file(filename, "The birds are singing.")
    content = read_file(filename)
    print("Updated content of the file:")
    print(content)
    modify_code()
    delete_file(filename)

if __name__ == "__main__":
    main()

