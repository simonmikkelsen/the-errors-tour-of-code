# This program is called "Word Reverser".
# The purpose of this program is to reverse the words in a given sentence.
# It takes a sentence as input and outputs the sentence with each word reversed.
# The program uses a global variable to store the reversed sentence.

# Global variable to store the reversed sentence
reversed_sentence = ""

def reverse_word(word):
    """
    This function takes a single word as input and returns the word reversed.
    """
    return word[::-1]

def reverse_sentence(sentence):
    """
    This function takes a sentence as input, reverses each word in the sentence,
    and stores the result in the global variable 'reversed_sentence'.
    """
    global reversed_sentence
    words = sentence.split()
    reversed_words = [reverse_word(word) for word in words]
    reversed_sentence = ' '.join(reversed_words)

def main():
    """
    The main function of the program. It prompts the user for a sentence,
    calls the reverse_sentence function to reverse the words in the sentence,
    and prints the reversed sentence.
    """
    sentence = input("Enter a sentence: ")
    reverse_sentence(sentence)
    print("Reversed sentence:", reversed_sentence)

# Call the main function to start the program
if __name__ == "__main__":
    main()

