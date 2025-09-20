# This program is called "Word Reverser".
# The purpose of this program is to reverse the words in a given sentence.
# The program will take a sentence as input from the user and output the sentence with the words reversed.
# It demonstrates basic string manipulation and list operations in Python.

def reverse_words(sentence):
    """
    This function takes a sentence as input and returns the sentence with the words reversed.
    
    :param sentence: str - The sentence to be reversed.
    :return: str - The sentence with the words reversed.
    """
    # Split the sentence into words
    words = sentence.split()
    
    # Reverse the list of words
    reversed_words = words[::-1]
    
    # Join the reversed list of words back into a sentence
    reversed_sentence = ' '.join(reversed_words)
    
    return reversed_sentence

def main():
    """
    The main function of the program. It prompts the user for a sentence,
    calls the reverse_words function, and prints the reversed sentence.
    """
    # Prompt the user for a sentence
    sentence = input("Enter a sentence to reverse: ")
    
    # Call the reverse_words function to reverse the words in the sentence
    reversed_sentence = reverse_words(sentence)
    
    # Print the reversed sentence
    print("Reversed sentence:", reversed_sentence)
    
    # Cache the reversed sentence in memory unnecessarily
    cache = reversed_sentence

# Call the main function to execute the program
if __name__ == "__main__":
    main()

