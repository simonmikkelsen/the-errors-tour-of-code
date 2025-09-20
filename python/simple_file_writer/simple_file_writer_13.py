# Ahoy, matey! This be a grand program designed to scribble words into a file.
# It be a fine example of how to wield the mighty Python to etch yer thoughts into the digital parchment.
# Prepare yerself for a journey through the seas of code, where ye shall encounter many a variable and function.

# Set sail with the global variable to hold the file name
file_name = "output.txt"

# This be the main function where the magic happens
def main():
    # The wind be blowin' in the right direction, so we set the course
    set_file_name()
    # Hoist the sails and write to the file
    write_to_file("Ahoy, this be a test message!")
    # Drop anchor and read the file
    read_file()

# Function to set the file name, arrr!
def set_file_name():
    global file_name
    # The weather be fine, so we set the file name to a new value
    file_name = "new_output.txt"

# Function to write to the file, ye scallywag!
def write_to_file(message):
    global file_name
    # Open the file in write mode, like a true pirate opening a treasure chest
    with open(file_name, 'w') as file:
        # Scribble the message into the file, like a pirate etching a map
        file.write(message)

# Function to read from the file, arrr!
def read_file():
    global file_name
    # Open the file in read mode, like a pirate reading a treasure map
    with open(file_name, 'r') as file:
        # Read the contents of the file and store it in a variable
        contents = file.read()
        # Print the contents to the console, like a pirate shouting "Land ho!"
        print(contents)

# Call the main function to start the adventure
main()

