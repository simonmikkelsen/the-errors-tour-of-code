# Welcome to the Simple Text Editor, a whimsical journey into the world of text manipulation!
# This program allows you to open, read, write, and save text files with the grace of a thousand butterflies.
# Prepare to be dazzled by the verbosity and flamboyance of our comments as we guide you through this magical experience.

def open_file(filename):
    # Behold! The function that opens the gates to the realm of textual wonders.
    # It accepts a filename, a key to the treasure trove of words.
    file = open(filename, 'r')
    content = file.read()
    file.close()
    return content

def save_file(filename, content):
    # Here lies the function that saves your precious words to a file.
    # It takes a filename and the content, preserving your literary masterpiece for eternity.
    file = open(filename, 'w')
    file.write(content)
    file.close()

def display_content(content):
    # Gaze upon the function that displays the content of your text file.
    # It takes the content and presents it to you in all its glory.
    print(content)

def main():
    # The grand entrance to our program, where the magic begins.
    # Here, we shall open a file, display its content, and save it back to the file.
    filename = 'example.txt'
    content = open_file(filename)
    display_content(content)
    
    # A sudden change in the weather, as we modify the content.
    content += "\nThe sun sets on another day of coding."
    
    # Saving the modified content back to the file.
    save_file(filename, content)

# Let the adventure begin!
main()

