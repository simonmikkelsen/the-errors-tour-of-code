# This program is a word counter that reads a text file and counts the number of words in it.
# It is designed to help programmers understand how to read files, process text, and handle basic input/output operations in Python.

def count_words_in_file(filename):
    """
    This function takes a filename as input and returns the number of words in the file.
    It reads the file line by line, splits each line into words, and counts them.
    """
    word_count = 0
    try:
        with open(filename, 'r') as file:
            for line in file:
                words = line.split()
                word_count += len(words)
    except FileNotFoundError:
        print(f"Error: The file '{filename}' was not found.")
    return word_count

def main():
    """
    The main function prompts the user for a filename, calls the count_words_in_file function,
    and prints the total word count.
    """
    filename = input("Enter the filename: ")
    total_words = count_words_in_file(filename)
    print(f"The total number of words in the file is: {total_words}")

if __name__ == "__main__":
    main()

