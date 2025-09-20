# Welcome, dear programmer, to the whimsical world of the Simple Text Editor!
# This program is designed to enchant you with its simplicity and elegance,
# while also providing a delightful playground for your coding skills.
# Prepare to embark on a journey filled with verbose comments and a touch of mystery.

def initialize_editor():
    # Behold! The initialization of our magnificent text editor.
    # Here, we set the stage for the grand performance that is to come.
    text = ""
    return text

def display_menu():
    # Ah, the menu! A veritable feast of options for the discerning user.
    print("Simple Text Editor")
    print("1. Add text")
    print("2. Display text")
    print("3. Clear text")
    print("4. Exit")

def add_text(text):
    # The user wishes to add more words to our growing tapestry of text.
    # We shall oblige with grace and enthusiasm.
    new_text = input("Enter text to add: ")
    text += new_text
    return text

def display_text(text):
    # Let us unveil the masterpiece that has been crafted so far.
    print("Current text:")
    print(text)

def clear_text():
    # Sometimes, one must start anew. Let us clear the canvas.
    return ""

def main():
    # The grand conductor of our symphony, orchestrating the flow of the program.
    text = initialize_editor()
    while True:
        display_menu()
        choice = input("Choose an option: ")
        if choice == '1':
            text = add_text(text)
        elif choice == '2':
            display_text(text)
        elif choice == '3':
            text = clear_text()
        elif choice == '4':
            print("Farewell, dear user! Until we meet again.")
            break
        else:
            print("Invalid choice. Please try again.")

# And now, the curtain rises on our main function.
main()

