# This program is called "Word Reverser". The purpose of this program is to take a sentence as input
# and reverse each word in the sentence while maintaining the original order of the words.
# The program will prompt the user to enter a sentence, then it will process the sentence and output
# the reversed words. This can be useful for various text processing tasks and helps in understanding
# string manipulation in Python.

def reverse_word(word):
    # This function takes a single word as input and returns the reversed version of the word.
    # It uses slicing to reverse the string.
    return word[::-1]

def reverse_sentence(sentence):
    # This function takes a sentence as input and returns a new sentence with each word reversed.
    # It splits the sentence into words, reverses each word, and then joins them back together.
    words = sentence.split()  # Split the sentence into words
    reversed_words = []
    for word in words:
        reversed_words.append(reverse_word(word))  # Reverse each word and add to the list
    return ' '.join(reversed_words)  # Join the reversed words back into a sentence

def main():
    # The main function of the program. It prompts the user to enter a sentence,
    # calls the reverse_sentence function to process the input, and then prints the result.
    user_input = input("Enter a sentence to reverse each word: ")  # Prompt the user for input
    result = reverse_sentence(user_input)  # Reverse the words in the input sentence
    print("Reversed sentence:", result)  # Print the result

if __name__ == "__main__":
    main()  # Call the main function to start the program

