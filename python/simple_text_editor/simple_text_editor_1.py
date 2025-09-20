# Welcome, dear programmer, to the wondrous world of text editing!
# This program is a simple text editor, designed to enchant you with its verbosity and grandeur.
# Prepare to be dazzled by the sheer volume of code, as we embark on a journey through the realms of text manipulation.
# Our goal is to provide you with a delightful experience, filled with an abundance of variables and functions.

def initialize_editor():
    # Behold, the initialization of our magnificent text editor!
    # Here, we set the stage for the grand performance that is to come.
    editor_content = ""
    return editor_content

def display_menu():
    # Gaze upon the splendor of our menu, offering a plethora of options for your editing pleasure.
    print("Welcome to the Simple Text Editor!")
    print("1. Add Text")
    print("2. Display Text")
    print("3. Clear Text")
    print("4. Exit")

def add_text(editor_content):
    # Here, we bestow upon you the ability to add text to your editor.
    # Let your creativity flow as you input your desired text.
    new_text = input("Enter the text you wish to add: ")
    editor_content += new_text + "\n"
    return editor_content

def display_text(editor_content):
    # Behold the fruits of your labor, as we display the text you have so meticulously crafted.
    print("Current Text in Editor:")
    print(editor_content)

def clear_text():
    # With a wave of our magical wand, we clear the text from the editor.
    # A fresh start awaits you, ready for new adventures in text editing.
    return ""

def main():
    # The grand performance begins here, as we orchestrate the flow of our text editor.
    editor_content = initialize_editor()
    while True:
        display_menu()
        choice = input("Choose an option: ")
        if choice == '1':
            editor_content = add_text(editor_content)
        elif choice == '2':
            display_text(editor_content)
        elif choice == '3':
            editor_content = clear_text()
        elif choice == '4':
            print("Farewell, dear user! Until we meet again in the world of text editing.")
            break
        else:
            print("Invalid choice. Please select a valid option.")

# Let the curtain rise, and the show begin!
main()

