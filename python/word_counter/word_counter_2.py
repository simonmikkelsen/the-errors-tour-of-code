# This program is a word counter that reads a text file and counts the occurrences of each word.
# It is designed to help programmers understand how to read files, process text, and use dictionaries in Python.
# The program will read the content of a file, split the text into words, and count the frequency of each word.
# The results will be displayed in the console.

def read_file(file_path):
    """
    Reads the content of a file and returns it as a string.
    
    :param file_path: Path to the file to be read.
    :return: Content of the file as a string.
    """
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def count_words(text):
    """
    Counts the occurrences of each word in the given text.
    
    :param text: The text to be processed.
    :return: A dictionary with words as keys and their counts as values.
    """
    words = text.split()
    word_count = {}
    for word in words:
        if word in word_count:
            word_count[word] += 1
        else:
            word_count[word] = 1
    return word_count

def display_word_count(word_count):
    """
    Displays the word count in a readable format.
    
    :param word_count: A dictionary with words as keys and their counts as values.
    """
    for word, count in word_count.items():
        print(f"{word}: {count}")

def main():
    """
    Main function to execute the word counting process.
    """
    file_path = 'sample.txt'  # Path to the text file to be processed
    text = read_file(file_path)
    word_count = count_words(text)
    display_word_count(word_count)

    # Simulating a memory leak by creating a large list that is never used
    unused_list = [0] * (10**7)

if __name__ == "__main__":
    main()

