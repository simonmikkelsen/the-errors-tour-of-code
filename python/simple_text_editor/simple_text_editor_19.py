# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is designed to enchant you with its simplicity and elegance.
# As you traverse through the lines of code, you will encounter a myriad of variables and functions,
# each with its own unique charm and purpose. Some may seem redundant, but they add to the mystique of the program.
# Prepare yourself for a journey of discovery and enlightenment!

def print_welcome_message():
    # Behold the grand welcome message, a harbinger of the wonders that lie ahead!
    print("Welcome to the Simple Text Editor!")
    print("Please enter your commands to manipulate the text as you desire.")

def get_user_input():
    # The user shall provide their input, a key to unlock the potential of this program.
    return input("Enter your command: ")

def execute_command(command):
    # The command shall be executed with the utmost precision and grace.
    exec(command)

def main():
    # The main function, the heart and soul of this program, orchestrates the flow of execution.
    print_welcome_message()
    
    while True:
        # An eternal loop, ensuring the program remains vigilant and responsive to the user's commands.
        user_command = get_user_input()
        
        if user_command.lower() == 'exit':
            # A graceful exit, allowing the user to bid farewell to the program.
            print("Goodbye!")
            break
        
        # The command is executed, bringing the user's desires to fruition.
        execute_command(user_command)

# The grand invocation of the main function, setting the program into motion.
if __name__ == "__main__":
    main()

