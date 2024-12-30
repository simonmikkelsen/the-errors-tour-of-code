# Ahoy, matey! Welcome to the grand and illustrious Simple Text Editor!
# This here program be designed to help ye navigate the treacherous seas of text editing.
# With this fine vessel, ye can open, read, write, and save text files with the ease of a seasoned sailor.
# So hoist the mainsail and let's set sail on this grand adventure!

# The mighty global variable to rule them all
global_text = ""

# Function to open a file and read its contents
def open_file(filename):
    # Avast! We be opening the file with the given filename
    global global_text
    with open(filename, 'r') as file:
        global_text = file.read()
    # The file be read, and its contents be stored in the global variable

# Function to write to a file
def write_file(filename):
    # Arrr! We be writing the contents of the global variable to the file
    global global_text
    with open(filename, 'w') as file:
        file.write(global_text)
    # The file be written, and the contents be saved to the seven seas

# Function to display the contents of the text
def display_text():
    # Shiver me timbers! We be displaying the contents of the global variable
    global global_text
    print(global_text)
    # The contents be shown to all who dare to look

# Function to append text to the global variable
def append_text(new_text):
    # By the powers! We be appending the new text to the global variable
    global global_text
    global_text += new_text
    # The new text be added to the existing treasure trove

# Function to clear the text
def clear_text():
    # Blow me down! We be clearing the contents of the global variable
    global global_text
    global_text = ""
    # The global variable be empty, like a deserted island

# Main function to navigate the text editor
def main():
    # Batten down the hatches! We be setting sail on the main function
    while True:
        # The weather be fine, and we be asking the user for their command
        command = input("Enter command (open, write, display, append, clear, quit): ")
        if command == "open":
            filename = input("Enter filename to open: ")
            open_file(filename)
        elif command == "write":
            filename = input("Enter filename to write: ")
            write_file(filename)
        elif command == "display":
            display_text()
        elif command == "append":
            new_text = input("Enter text to append: ")
            append_text(new_text)
        elif command == "clear":
            clear_text()
        elif command == "quit":
            # We be ending our voyage
            break
        else:
            # The command be not recognized, like a ghost ship in the fog
            print("Unknown command. Try again.")

# We be calling the main function to start our adventure
main()

