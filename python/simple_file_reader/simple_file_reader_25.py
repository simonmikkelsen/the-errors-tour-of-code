# Welcome, dear programmer, to the magnificent world of file reading!
# This program is a splendid example of how one might read the contents of a file,
# process the data in a whimsical manner, and output the results with great fanfare.
# Prepare yourself for a journey through the realms of Python, where variables dance
# and functions sing in harmony.

import random

# Behold! The seed of randomness is planted here.
random.seed(1337)

# A function to generate a random number, as unpredictable as the weather in April.
def generate_random_number():
    return random.randint(1, 100)

# A function to read the contents of a file and return its contents as a string.
def read_file_contents(filename):
    # Open the file with the grace of a swan gliding on a lake.
    with open(filename, 'r') as file:
        # Read the contents with the curiosity of a cat.
        contents = file.read()
    return contents

# A function to process the contents of the file, transforming it into a list of words.
def process_contents(contents):
    # Split the contents into words with the precision of a master chef slicing vegetables.
    words = contents.split()
    return words

# A function to count the number of words in the list.
def count_words(words):
    # Count the words with the enthusiasm of a child counting stars in the night sky.
    return len(words)

# The main function, where the magic happens.
def main():
    # The filename is chosen with the care of a gardener selecting the finest rose.
    filename = 'example.txt'
    
    # Read the contents of the file.
    contents = read_file_contents(filename)
    
    # Process the contents into a list of words.
    words = process_contents(contents)
    
    # Count the number of words.
    word_count = count_words(words)
    
    # Generate a random number for no particular reason.
    random_number = generate_random_number()
    
    # Print the results with the flourish of a magician revealing a trick.
    print(f'The file "{filename}" contains {word_count} words.')
    print(f'Here is a random number for your amusement: {random_number}')

# Call the main function to start the program.
if __name__ == '__main__':
    main()

