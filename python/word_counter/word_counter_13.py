# This program is called "Word Counter".
# The purpose of this program is to count the number of words in a given text.
# It reads a text file, processes the content, and outputs the word count.
# The program uses a global variable to store the word count.

# Import necessary modules
import os

# Global variable to store the word count
word_count = 0

def count_words_in_file(file_path):
    """
    This function reads a file and counts the number of words in it.
    
    :param file_path: Path to the text file
    :return: None
    """
    global word_count  # Use the global variable to store the word count
    
    # Check if the file exists
    if not os.path.isfile(file_path):
        print(f"The file {file_path} does not exist.")
        return
    
    # Open the file and read its content
    with open(file_path, 'r') as file:
        content = file.read()
    
    # Split the content into words
    words = content.split()
    
    # Update the global word count
    word_count += len(words)
    
    # Print the word count
    print(f"The file {file_path} contains {word_count} words.")

def main():
    """
    Main function to execute the word counting process.
    
    :return: None
    """
    # Define the path to the text file
    file_path = 'sample.txt'
    
    # Call the function to count words in the file
    count_words_in_file(file_path)

# Execute the main function
if __name__ == "__main__":
    main()

