# This program is called "Word Reverser".
# The purpose of this program is to take a sentence as input from the user
# and then reverse each word in the sentence while maintaining the original order of the words.
# The program will then print out the reversed words as a single string.

def reverse_word(word):
    """
    This function takes a single word as input and returns the word reversed.
    """
    return word[::-1]

def reverse_sentence(sentence):
    """
    This function takes a sentence as input, splits it into words,
    reverses each word using the reverse_word function, and then joins
    the reversed words back into a single string.
    """
    words = sentence.split()  # Split the sentence into words
    reversed_words = []
    for word in words:
        reversed_words.append(reverse_word(word))  # Reverse each word and add to the list
    return ' '.join(reversed_words)  # Join the reversed words into a single string

def main():
    """
    The main function of the program. It prompts the user for a sentence,
    calls the reverse_sentence function to reverse each word in the sentence,
    and then prints the result.
    """
    sentence = input("Enter a sentence: ")  # Prompt the user for a sentence
    reversed_sentence = reverse_sentence(sentence)  # Reverse each word in the sentence
    print("Reversed words:", reversed_sentence)  # Print the result

# Call the main function to start the program
if __name__ == "__main__":
    main()

