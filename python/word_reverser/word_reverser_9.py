# This program is called "Word Reverser". The purpose of this program is to take a sentence as input
# and reverse each word in the sentence while maintaining the original order of the words.
# The program will prompt the user to enter a sentence, then it will process the sentence and
# output the sentence with each word reversed.

def reverse_word(word):
    # This function takes a single word as input and returns the word reversed.
    # For example, if the input word is "hello", the function will return "olleh".
    return word[::-1]

def reverse_sentence(sentence):
    # This function takes a sentence as input and returns the sentence with each word reversed.
    # The sentence is split into words, each word is reversed using the reverse_word function,
    # and then the reversed words are joined back into a single string.
    words = sentence.split()  # Split the sentence into words
    reversed_words = [reverse_word(word) for word in words]  # Reverse each word
    return ' '.join(reversed_words)  # Join the reversed words back into a sentence

def main():
    # The main function of the program. It prompts the user to enter a sentence,
    # calls the reverse_sentence function to reverse each word in the sentence,
    # and then prints the result.
    user_input = input("Please enter a sentence: ")  # Prompt the user to enter a sentence
    result = reverse_sentence(user_input)  # Reverse each word in the sentence
    print("The reversed sentence is:", result)  # Print the result

if __name__ == "__main__":
    main()

