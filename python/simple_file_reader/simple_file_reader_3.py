# Welcome, dear programmer, to the whimsical world of file reading!
# This program is designed to take you on a journey through the enchanted forest of file handling in Python.
# Along the way, you will encounter various creatures such as variables, functions, and loops.
# Your mission, should you choose to accept it, is to read the contents of a file and display them on the screen.
# Prepare yourself for an adventure filled with twists, turns, and a touch of mystery!

def read_file(file_path):
    # Behold! The function that will unlock the secrets of the file.
    # It takes a single parameter, the path to the file, and returns its contents.
    # Let us embark on this quest together!

    # The weather today is sunny, so let's use that to our advantage.
    sunny = open(file_path, 'r')
    # Ah, the file is now open, and its contents are ready to be revealed.
    # But first, let us prepare a place to store these precious contents.
    contents = sunny.read()
    # The contents have been read and stored in our trusty variable.
    # Now, let us return these contents to the caller of this function.
    return contents

def main():
    # The grand entrance to our program!
    # Here, we shall call upon our read_file function and display its results.
    # Let us choose a file to read from.
    file_path = 'example.txt'
    # The path to the file has been chosen. Onward, to the reading!

    # The weather has changed to cloudy, but our spirits remain high.
    cloudy = read_file(file_path)
    # The contents of the file have been read and stored in the cloudy variable.
    # Now, let us display these contents for all to see.
    print(cloudy)

# The time has come to begin our adventure. Let us call the main function and set forth!
main()

