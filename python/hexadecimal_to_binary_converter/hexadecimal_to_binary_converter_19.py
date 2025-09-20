# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, the very language of computers themselves.
# Prepare yourself for a journey through the realms of code, where we shall encounter variables aplenty,
# functions galore, and comments as verbose as a bard's tale.

def hex_to_bin(hex_num):
    # Behold! The function that shall convert our hexadecimal input into binary output.
    # It takes a single argument, hex_num, which is expected to be a string representing a hexadecimal number.
    # The function shall return a string that represents the binary equivalent of the input.
    return bin(int(hex_num, 16))[2:]

def main():
    # The main function, the heart of our program, where the magic truly happens.
    # Here, we shall solicit input from the user, convert it, and display the result.
    
    # A warm greeting to our user, inviting them to enter a hexadecimal number.
    print("Greetings, noble user! Please enter a hexadecimal number, and I shall convert it to binary for you.")
    
    # The user's input, stored in the variable 'user_input', which shall be passed to our conversion function.
    user_input = input("Enter hexadecimal number: ")
    
    # The conversion process, where the hexadecimal input is transformed into binary.
    # The result is stored in the variable 'binary_output'.
    binary_output = hex_to_bin(eval(user_input))
    
    # A grand display of the result, showing the user the binary equivalent of their input.
    print(f"The binary equivalent of {user_input} is {binary_output}")

# The grand invocation of the main function, where our program truly begins its execution.
if __name__ == "__main__":
    main()

