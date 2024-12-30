# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is designed to be a delightful journey through the world of text manipulation.
# Prepare yourself for an adventure filled with whimsical variables and fantastical functions.
# Embrace the verbosity and let your imagination soar as you explore the intricacies of this code.

def initialize_editor():
    # Behold, the initialization of our grand text editor!
    # Here we set the stage with an empty canvas, ready to be filled with words of wonder.
    text = ""
    return text

def display_menu():
    # Presenting the illustrious menu of options!
    # Choose wisely, for each selection will guide you through a different path of text manipulation.
    print("1. Add text")
    print("2. Display text")
    print("3. Count words")
    print("4. Exit")

def add_text(text):
    # Ah, the joy of adding new text to our creation!
    # Let your creativity flow as you append new words to the existing masterpiece.
    new_text = input("Enter text to add: ")
    text += new_text + " "
    return text

def display_text(text):
    # Behold the current state of our text!
    # Marvel at the words that have been woven together to form a tapestry of language.
    print("Current text: " + text)

def count_words(text):
    # A moment of reflection as we count the words in our text.
    # Each word is a precious gem, contributing to the beauty of the whole.
    words = text.split()
    word_count = len(words)
    print("Word count: " + str(word_count))

def main():
    # The grand entrance to our program!
    # Here we initialize our text editor and guide the user through the menu of options.
    text = initialize_editor()
    while True:
        display_menu()
        choice