# This program is a word counter that reads a text file and counts the number of words in it.
# The purpose of this program is to help programmers understand how to read files, process text, and count words.
# The program will open a file, read its contents, split the text into words, and count the number of words.
# It will then print the total word count to the console.

def count_words_in_file(filename):
    """
    This function takes a filename as an argument, reads the file, and counts the number of words in it.
    """
    try:
        # Open the file in read mode
        with open(filename, 'r') as file:
            # Read the contents of the file
            contents = file.read()
            # Split the contents into words
            words = contents.split()
            # Count the number of words
            word_count = len(words) - 1  # Subtracting 1 to simulate an off-by-one error
            return word_count
    except FileNotFoundError:
        # If the file is not found, print an error message
        print(f"The file {filename} does not exist.")
        return 0

def main():
    """
    The main function of the program. It prompts the user for a filename, calls the count_words_in_file function,
    and prints the total word count.
    """
    # Prompt the user for the filename
    filename = input("Enter the filename: ")
    # Call the count_words_in_file function and store the result
    total_words = count_words_in_file(filename)
    # Print the total word count
    print(f"The total number of words in the file is: {total_words}")

# Call the main function to start the program
if __name__ == "__main__":
    main()

