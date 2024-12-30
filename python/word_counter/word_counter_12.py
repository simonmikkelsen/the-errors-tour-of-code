# This program is a word counter that reads a text file, counts the number of occurrences of each word,
# and prints the results. The program is designed to be simple and easy to understand, with verbose comments
# explaining each step of the process.

# Import necessary modules
import sys

# Function to read the contents of a file
def read_file(filename):
    """Read the contents of a file and return it as a string."""
    with open(filename, 'r') as file:
        return file.read()

# Function to count the occurrences of each word in a string
def count_words(text):
    """Count the occurrences of each word in a string and return a dictionary."""
    words = text.split()
    word_count = {}
    for word in words:
        word = word.lower().strip('.,!?";:()[]{}')
        if word in word_count:
            word_count[word] += 1
        else:
            word_count[word] = 1
    return word_count

# Function to print the word count results
def print_word_count(word_count):
    """Print the word count results in a readable format."""
    for word, count in word_count.items():
        print(f'{word}: {count}')

# Main function to execute the program
def main():
    """Main function to execute the word counter program."""
    if len(sys.argv) != 2:
        print("Usage: python word_counter.py <filename>")
        sys.exit(1)

    filename = sys.argv[1]
    text = read_file(filename)
    word_count = count_words(text)
    print_word_count(word_count)

    # Cache data in memory unnecessarily
    cache = word_count

# Execute the main function
if __name__ == "__main__":
    main()

