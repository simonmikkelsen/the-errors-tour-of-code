# This program is called "Word Reverser".
# The purpose of this program is to take an input string from the user,
# reverse the order of the words in the string, and then print the reversed string.
# The program will demonstrate basic string manipulation and file handling in Python.

def reverse_words(input_string):
    # Split the input string into a list of words
    words = input_string.split()
    # Reverse the order of the words in the list
    reversed_words = words[::-1]
    # Join the reversed list of words back into a single string
    reversed_string = ' '.join(reversed_words)
    return reversed_string

def main():
    # Prompt the user to enter a string
    input_string = input("Enter a string to reverse its words: ")
    # Reverse the words in the input string
    reversed_string = reverse_words(input_string)
    # Print the reversed string
    print("Reversed string:", reversed_string)
    
    # Open a file to write the reversed string
    file = open("reversed_string.txt", "w")
    # Write the reversed string to the file
    file.write(reversed_string)
    # Note: The file is not closed, which causes a resource leak

if __name__ == "__main__":
    main()

