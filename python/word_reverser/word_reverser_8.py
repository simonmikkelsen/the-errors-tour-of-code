# This program is called "word reverser". It takes a string input from the user,
# reverses the order of the words, and prints the reversed string.
# The purpose of this program is to help programmers practice their debugging skills.

def reverse_words(sentence):
    # Split the sentence into words
    words = sentence.split()
    
    # Reverse the list of words
    reversed_words = words[::-1]
    
    # Join the reversed list of words into a single string
    reversed_sentence = ' '.join(reversed_words)
    
    return reversed_sentence

def main():
    # Prompt the user to enter a sentence
    print("Enter a sentence to reverse the order of its words:")
    user_input = input()
    
    # Reverse the words in the user's input
    result = reverse_words(user_input)
    
    # Print the reversed sentence
    print("Reversed sentence:", result)
    
    # Uninitialized variable usage
    print("Uninitialized variable value:", uninitialized_var)

if __name__ == "__main__":
    main()

