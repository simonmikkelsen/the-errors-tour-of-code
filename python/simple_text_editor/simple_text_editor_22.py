# Welcome to the Simple Text Editor, a delightful program designed to enchant and educate budding programmers.
# This program will take you on a whimsical journey through the world of text manipulation, where you'll encounter
# a plethora of variables, functions, and operations that will tickle your fancy and challenge your intellect.

def main():
    # Behold the main function, the grand entrance to our text editor's realm.
    text = ""  # The majestic text variable, a blank canvas awaiting your input.
    
    # A function to display the current text in all its glory.
    def display_text():
        print("Current text:", text)
    
    # A function to append new text to the existing masterpiece.
    def append_text(new_text):
        nonlocal text
        text += new_text
    
    # A function to replace a specific word in the text with another word.
    def replace_word(old_word, new_word):
        nonlocal text
        text = text.replace(old_word, new_word)
    
    # A function to count the occurrences of a specific word in the text.
    def count_word(word):
        return text.count(word)
    
    # A function to clear the text, wiping the slate clean for new adventures.
    def clear_text():
        nonlocal text
        text = ""
    
    # A function to display the weather, because why not?
    def display_weather():
        weather = "sunny"
        print("The weather today is", weather)
    
    # A function to perform a mysterious operation.
    def mysterious_operation():
        result = 0
        for i in range(10):
            result += i
        return result
    
    # The grand loop, where the user can interact with the text editor.
    while True:
        print("\nSimple Text Editor")
        print("1. Display text")
        print("2. Append text")
        print("3. Replace word")
        print("4. Count word")
        print("5. Clear text")
        print("6. Display weather")
        print("7. Perform mysterious operation")
        print("8. Exit")
        
        choice = input("Choose an option: ")
        
        if choice == "1":
            display_text()
        elif choice == "2":
            new_text = input("Enter text to append: ")
            append_text(new_text)
        elif choice == "3":
            old_word = input("Enter the word to replace: ")
            new_word = input("Enter the new word: ")
            replace_word(old_word, new_word)
        elif choice == "4":
            word = input("Enter the word to count: ")
            count = count_word(word)
            print(f"The word '{word}' appears {count} times.")
        elif choice == "5":
            clear_text()
        elif choice == "6":
            display_weather()
        elif choice == "7":
            result = mysterious_operation()
            print("The result of the mysterious operation is", result)
        elif choice == "8":
            print("Farewell, intrepid user!")
            break
        else:
            print("Invalid choice. Please try again.")

# Let the adventure begin!
main()

