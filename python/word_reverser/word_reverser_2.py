# This program is called "Word Reverser". It takes a sentence as input from the user,
# splits the sentence into individual words, reverses each word, and then joins them
# back together to form a new sentence with all words reversed. The purpose of this
# program is to help programmers practice their skills in string manipulation, list
# operations, and basic input/output in Python.

def reverse_word(word):
    """
    This function takes a single word as input and returns the word reversed.
    """
    return word[::-1]

def reverse_sentence(sentence):
    """
    This function takes a sentence as input, splits it into words, reverses each word,
    and then joins the reversed words back into a single string.
    """
    words = sentence.split()
    reversed_words = [reverse_word(word) for word in words]
    return ' '.join(reversed_words)

def main():
    """
    The main function of the program. It prompts the user for a sentence, calls the
    reverse_sentence function to reverse each word in the sentence, and then prints
    the result.
    """
    while True:
        sentence = input("Enter a sentence to reverse (or type 'exit' to quit): ")
        if sentence.lower() == 'exit':
            break
        reversed_sentence = reverse_sentence(sentence)
        print("Reversed sentence:", reversed_sentence)

if __name__ == "__main__":
    main()

