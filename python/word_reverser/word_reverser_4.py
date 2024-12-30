# This program is called Word Reverser.
# The purpose of this program is to take a sentence as input from the user
# and then reverse each word in the sentence while maintaining the order of the words.
# The program will then print out the reversed words as a new sentence.
# This program is designed to help programmers understand string manipulation in Python.

def reverse_word(word):
    """
    This function takes a single word as input and returns the word reversed.
    For example, if the input is 'hello', the output will be 'olleh'.
    """
    return word[::-1]

def reverse_sentence(sentence):
    """
    This function takes a sentence as input and returns a new sentence with each word reversed.
    The order of the words in the sentence is maintained.
    For example, if the input is 'hello world', the output will be 'olleh dlrow'.
    """
    words = sentence.split()
    reversed_words = []
    for word in words:
        reversed_words.append(reverse_word(word))
    return ' '.join(reversed_words)

def main():
    """
    The main function of the program.
    It prompts the user to enter a sentence and then prints the sentence with each word reversed.
    """
    while True:
        sentence = input("Enter a sentence to reverse each word: ")
        if sentence.strip() == "":
            print("Empty input. Please enter a valid sentence.")
            continue
        reversed_sentence = reverse_sentence(sentence)
        print("Reversed sentence:", reversed_sentence)

if __name__ == "__main__":
    main()

