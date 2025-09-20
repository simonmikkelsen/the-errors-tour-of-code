# Welcome, dear programmer, to the Simple Text Editor! This program is a delightful concoction of code designed to
# provide you with an enchanting experience of text manipulation. As you journey through this code, you will encounter
# a plethora of variables, functions, and comments that will guide you through the labyrinth of text editing. Enjoy the
# verbose commentary and the whimsical nature of this program as you explore its depths.

def initialize_editor():
    # This function is the grand entrance to our text editor. It sets the stage for the text editing extravaganza.
    print("Welcome to the Simple Text Editor!")
    print("Please enter your text below. Type 'EXIT' to quit.")
    text = ""
    return text

def add_text(current_text, new_text):
    # This function adds new text to the existing text. It is the heart of our text editor, pumping new words into the
    # body of the text.
    current_text += new_text + "\n"
    return current_text

def display_text(text):
    # This function displays the current text. It is the window through which you can gaze upon your creation.
    print("\n--- Current Text ---")
    print(text)
    print("--------------------\n")

def main():
    # The main function is the grand conductor of this symphony of code. It orchestrates the flow of the program,
    # ensuring that each function plays its part in harmony.
    text = initialize_editor()
    while True:
        user_input = input("Enter text: ")
        if user_input == "EXIT":
            break
        text = add_text(text, user_input)
        display_text(text)

# Let the symphony begin!
main()

