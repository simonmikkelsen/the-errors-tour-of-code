# Welcome, dear programmer, to the magnificent and wondrous world of the Simple Text Editor!
# This program is designed to be a delightful journey through the realms of text manipulation,
# where you shall encounter a plethora of functions and variables, each with its own unique charm.
# Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.

def initialize_editor():
    # Behold, the initialization of our grand text editor!
    # Here, we shall set the stage for the text editing extravaganza that is about to unfold.
    text = ""
    return text

def display_menu():
    # Gaze upon the menu of options, each one a gateway to a different facet of text editing splendor.
    print("1. Add text")
    print("2. Display text")
    print("3. Clear text")
    print("4. Exit")

def add_text(text):
    # Ah, the joy of adding text! This function allows you to append your thoughts and musings to the editor.
    new_text = input("Enter text to add: ")
    text += new_text + "\n"
    return text

def display_text(text):
    # Behold the fruits of your labor! This function displays the text you have so lovingly crafted.
    print("Current text:")
    print(text)

def clear_text():
    # Sometimes, one must start anew. This function clears the text, giving you a fresh canvas.
    return ""

def main():
    # The grand entrance to our program! Here, we shall orchestrate the flow of the text editor.
    text = initialize_editor()
    while True:
        display_menu()
        choice = input("Choose an option: ")
        if choice == "1":
            text = add_text(text)
        elif choice == "2":
            display_text(text)
        elif choice == "3":
            text = clear_text()
        elif choice == "4":
            break
        else:
            print("Invalid choice, please try again.")

# Let the symphony of text editing commence!
main()

