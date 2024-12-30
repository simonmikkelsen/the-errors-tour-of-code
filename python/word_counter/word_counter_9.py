# This program is a word counter that reads a text file and counts the number of words in it.
# The program is designed to help users understand how to read files, process text, and count words.
# It includes detailed comments to explain each step of the process.

def count_words_in_file(filename):
    """
    This function takes a filename as input and returns the number of words in the file.
    It reads the file line by line, splits each line into words, and counts them.
    """
    word_count = 0  # Initialize the word count to zero

    try:
        with open(filename, 'r') as file:  # Open the file in read mode
            for line in file:  # Iterate over each line in the file
                words = line.split()  # Split the line into words
                word_count += len(words)  # Add the number of words in the line to the total count

    except FileNotFoundError:
        print(f"The file {filename} does not exist.")  # Print an error message if the file is not found

    return word_count  # Return the total word count

# Main function to execute the word counting
if __name__ == "__main__":
    filename = "sample.txt"  # Specify the filename to be processed
    total_words = count_words_in_file(filename)  # Call the function to count words in the file
    print(f"The total number of words in the file is: {total_words}")  # Print the total word count

