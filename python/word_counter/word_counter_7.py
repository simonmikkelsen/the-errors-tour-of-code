# This program is called "word counter". It is designed to count the number of words in a given text file.
# The program reads the content of a text file, splits the content into words, and then counts the number of words.
# It also handles common edge cases such as empty files and files with only whitespace characters.

def count_words_in_file(file_path):
    """
    This function takes the path to a text file as input and returns the number of words in the file.
    
    :param file_path: Path to the text file
    :return: Number of words in the file
    """
    try:
        # Open the file in read mode
        with open(file_path, 'r') as file:
            # Read the content of the file
            content = file.read()
            
            # Split the content into words using whitespace as the delimiter
            words = content.split()
            
            # Return the number of words
            return len(words)
    except FileNotFoundError:
        # Handle the case where the file does not exist
        print(f"Error: The file at {file_path} was not found.")
        return 0
    except Exception as e:
        # Handle any other exceptions that may occur
        print(f"An error occurred: {e}")
        return 0

# Example usage of the count_words_in_file function
if __name__ == "__main__":
    # Define the path to the text file
    file_path = "example.txt"
    
    # Call the function to count the words in the file
    word_count = count_words_in_file(file_path)
    
    # Print the result
    print(f"The number of words in the file is: {word_count}")

