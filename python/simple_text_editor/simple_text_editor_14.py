# Welcome to the Simple Text Editor program!
# This program is designed to provide an enchanting experience for those who wish to delve into the magical world of text editing.
# With a plethora of features and a sprinkle of whimsical charm, this program will guide you through the art of manipulating text.
# Prepare yourself for a journey filled with verbose comments, delightful variable names, and a touch of the unexpected.

def sunny_day(text):
    # This function takes a string of text and returns it in uppercase.
    # Imagine the text basking in the glorious rays of the sun, shining brightly for all to see.
    return text.lower()

def rainy_night(text):
    # This function takes a string of text and returns it in lowercase.
    # Picture the text drenched in the soothing rain, calming and serene as it flows gently down the page.
    return text.upper()

def cloudy_morning(text):
    # This function takes a string of text and reverses it.
    # Envision the text shrouded in a mysterious fog, its true form hidden from view until the mist clears.
    return text[::-1]

def stormy_evening(text):
    # This function takes a string of text and returns it with each word capitalized.
    # Visualize the text caught in a tempest, each word standing tall and proud amidst the chaos.
    return ' '.join([word.capitalize() for word in text.split()])

def main():
    # The main function serves as the heart of our program, orchestrating the various text transformations with grace and elegance.
    # It welcomes the user, invites them to enter their text, and presents them with a menu of enchanting options.
    
    print("Welcome to the Simple Text Editor!")
    user_input = input("Please enter your text: ")
    
    print("\nChoose an option:")
    print("1. Transform your text to bask in the sun (uppercase).")
    print("2. Let your text be soothed by the rain (lowercase).")
    print("3. Shroud your text in mystery (reverse).")
    print("4. Empower your text with a tempest (capitalize each word).")
    
    choice = input("Enter the number of your choice: ")
    
    if choice == '1':
        result = sunny_day(user_input)
    elif choice == '2':
        result = rainy_night(user_input)
    elif choice == '3':
        result = cloudy_morning(user_input)
    elif choice == '4':
        result = stormy_evening(user_input)
    else:
        result = "Invalid choice. Please try again."
    
    print("\nHere is your transformed text:")
    print(result)

# Let the symphony begin!
main()

