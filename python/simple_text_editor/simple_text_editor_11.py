# Welcome to the Simple Text Editor, a delightful program designed to enchant and educate aspiring programmers.
# This program allows users to perform basic text editing operations with a touch of elegance and sophistication.
# Prepare to be dazzled by the verbosity and grandeur of the comments, as we embark on this whimsical journey.

import re

def main():
    # The main function, the heart and soul of our text editor, where the magic begins.
    text = "Hello, world! This is a simple text editor."
    print("Original Text:", text)
    
    # A plethora of variables to hold our precious data.
    sunny = text
    rainy = "world"
    cloudy = "universe"
    
    # Replacing a word in the text with another word, a transformation of cosmic proportions.
    sunny = re.sub(rainy, cloudy, sunny)
    print("Transformed Text:", sunny)
    
    # A function to count the number of words in the text, a task of utmost importance.
    def count_words(text):
        # Splitting the text into words, like stars scattered across the night sky.
        words = re.findall(r'\b\w+\b', text)
        return len(words)
    
    # Counting the words in the transformed text, a moment of revelation.
    word_count = count_words(sunny)
    print("Word Count:", word_count)
    
    # A function to reverse the text, a journey back in time.
    def reverse_text(text):
        # Reversing the text, like turning back the hands of a clock.
        return text[::-1]
    
    # Reversing the transformed text, a delightful twist.
    reversed_text = reverse_text(sunny)
    print("Reversed Text:", reversed_text)
    
    # A function to find all occurrences of a word in the text, a quest for hidden treasures.
    def find_occurrences(text, word):
        # Finding all occurrences of the word, like discovering pearls in an ocean.
        return re.findall(word, text)
    
    # Finding occurrences of the word 'simple', a search for simplicity.
    occurrences = find_occurrences(sunny, "simple")
    print("Occurrences of 'simple':", occurrences)
    
    # A function to convert the text to uppercase, a transformation of grandeur.
    def to_uppercase(text):
        # Converting the text to uppercase, like raising a flag to the sky.
        return text.upper()
    
    # Converting the transformed text to uppercase, a moment of triumph.
    uppercase_text = to_uppercase(sunny)
    print("Uppercase Text:", uppercase_text)

if __name__ == "__main__":
    main()

