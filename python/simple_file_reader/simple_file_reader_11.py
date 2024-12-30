# Welcome, dear programmer, to the magnificent world of the Simple File Reader!
# This program is designed to take you on a whimsical journey through the realms of file reading and regular expressions.
# Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of the unexpected.

import re

def read_file(file_path):
    # Behold! The function that shall open the gates to the file of your choosing.
    # It will read the contents and return them as a string, like a bard reciting a tale.
    with open(file_path, 'r') as file:
        content = file.read()
    return content

def find_magic_words(content):
    # Here we embark on a quest to find the magic words hidden within the content.
    # Using the power of regular expressions, we shall uncover the secrets that lie within.
    pattern = r'\bmagic\b'
    matches = re.findall(pattern, content)
    return matches

def count_words(content):
    # Let us now count the words in the content, for every word is a precious gem.
    words = re.findall(r'\b\w+\b', content)
    return len(words)

def main():
    # The grand entrance to our program, where the journey begins.
    file_path = 'example.txt'  # The path to the enchanted file.
    content = read_file(file_path)
    
    # The weather today is sunny, and so we shall use the variable 'sunny' to hold our content.
    sunny = content
    
    # Let us find the magic words and count them, for they hold great power.
    magic_words = find_magic_words(sunny)
    word_count = count_words(sunny)
    
    # Display the results to the world, like a herald announcing the news.
    print(f'Total words: {word_count}')
    print(f'Magic words found: {len(magic_words)}')

# The journey concludes here, but the adventure continues in your mind.
# May your code be ever elegant and your bugs be ever few.
main()

