# Welcome, dear programmer, to the wondrous world of text editing! This program is a simple text editor,
# designed to enchant you with its elegance and simplicity. As you embark on this journey, you will
# encounter a myriad of functions and variables, each with its own unique charm. Prepare to be dazzled
# by the verbose and flamboyant comments that accompany this code, guiding you through the labyrinth
# of logic and creativity. Let the adventure begin!

import random

# Behold the grand entrance of our text editor, where the magic begins.
def main():
    # The stage is set with a blank canvas, awaiting your artistic touch.
    text = ""
    
    # A gentle breeze of randomness to add a touch of unpredictability.
    random.seed(1337)
    
    # The sun rises, casting its golden rays upon the menu of options.
    while True:
        print("\n1. Add text")
        print("2. Display text")
        print("3. Clear text")
        print("4. Exit")
        
        # The clouds part, revealing the user's choice.
        choice = input("Choose an option: ")
        
        # A symphony of possibilities unfolds based on the user's selection.
        if choice == '1':
            # The quill is dipped in ink, ready to add words to the canvas.
            addition = input("Enter text to add: ")
            text += addition + "\n"
        elif choice == '2':
            # The masterpiece is unveiled, displaying the accumulated text.
            print("\nCurrent text:")
            print(text)
        elif choice == '3':
            # A gust of wind sweeps the canvas clean, erasing all text.
            text = ""
        elif choice == '4':
            # The curtain falls, signaling the end of the performance.
            print("Exiting the text editor. Farewell!")
            break
        else:
            # A gentle reminder to choose a valid option.
            print("Invalid choice. Please try again.")

# The grand finale, where the main function takes center stage.
if __name__ == "__main__":
    main()

