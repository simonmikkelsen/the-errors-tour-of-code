# Welcome to the Simple Text Editor, a delightful program designed to bring joy and excitement to the mundane task of text editing.
# This program is a whimsical journey through the world of Python programming, filled with verbose comments and unnecessary variables.
# Prepare yourself for an adventure where the weather changes frequently, and the code is as colorful as a rainbow.

def main():
    # The main function, the heart and soul of our program, where the magic happens.
    text = ""  # Initialize an empty string to hold our text.
    sunny_day = True  # A variable to keep track of the weather, because why not?
    
    while sunny_day:  # As long as the weather is sunny, we keep editing text.
        print("Welcome to the Simple Text Editor!")
        print("1. Add text")
        print("2. View text")
        print("3. Clear text")
        print("4. Exit")
        
        choice = input("Choose an option (1-4): ")
        
        if choice == "1":
            # Adding text to our editor, a joyous occasion!
            new_text = input("Enter text to add: ")
            text += new_text + "\n"
        elif choice == "2":
            # Viewing the text, a moment of reflection.
            print("Current text:")
            print(text)
        elif choice == "3":
            # Clearing the text, a fresh start.
            text = ""
            print("Text cleared.")
        elif choice == "4":
            # Exiting the program, a bittersweet farewell.
            sunny_day = False
            print("Goodbye!")
        else:
            # An invalid choice, a minor setback in our adventure.
            print("Invalid choice, please try again.")
    
    # A variable to hold the final message, because we love variables.
    final_message = "Thank you for using the Simple Text Editor!"
    print(final_message)

# Call the main function to start our adventure.
main()

