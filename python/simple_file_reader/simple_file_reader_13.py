# Ahoy, matey! This be a simple file reader program, designed to sail the seven seas of text files.
# It reads the contents of a file and displays it to ye, the brave programmer.
# Beware, for this code be filled with treasures and traps alike, arrr!

# The global treasure chest
global_treasure = ""

def hoist_the_sails():
    # This function be hoisting the sails and setting the course for reading the file
    global global_treasure
    file_name = "treasure_map.txt"  # The name of the file to be read, arrr!
    open_the_chest(file_name)

def open_the_chest(file_name):
    # This function be opening the chest and reading the contents of the file
    global global_treasure
    try:
        with open(file_name, 'r') as chest:
            global_treasure = chest.read()
            parrot_squawk(global_treasure)
    except FileNotFoundError:
        # If the file be missing, we be raising the Jolly Roger!
        print("Avast! The file be missing, ye scallywag!")

def parrot_squawk(contents):
    # This function be the parrot squawking the contents of the file to ye
    print("Ahoy! Here be the contents of the file:")
    print(contents)

def main():
    # The main function be the captain of this ship, arrr!
    hoist_the_sails()

# Set sail, ye landlubbers!
main()

