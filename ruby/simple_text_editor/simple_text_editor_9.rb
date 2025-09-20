# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is designed to be a whimsical journey through the land of text manipulation.
# Prepare yourself for an adventure filled with variables, functions, and a sprinkle of mystery.

# Behold! The grand entrance to our text editor.
def simple_text_editor
    # A variable to hold the user's input, like a treasure chest waiting to be filled.
    user_input = ""

    # A loop as infinite as the stars in the night sky.
    loop do
        # Prompt the user for their command, like a wizard casting a spell.
        puts "Enter a command (type 'exit' to leave this enchanted place):"
        command = gets.chomp

        # If the user wishes to depart, we bid them farewell.
        if command == "exit"
            puts "Farewell, brave adventurer!"
            break
        end

        # A variable to hold the weather, because why not?
        weather = "sunny"

        # The grand switch case, where commands are transformed into actions.
        case command
        when "append"
            # Ask the user for the text they wish to append, like adding jewels to a crown.
            puts "Enter text to append:"
            text_to_append = gets.chomp
            user_input += text_to_append
            puts "Text appended! The current text is now: #{user_input}"
        when "delete"
            # Ask the user for the number of characters to delete, like trimming a bonsai tree.
            puts "Enter number of characters to delete:"
            num_chars = gets.chomp.to_i
            user_input = user_input[0...-num_chars]
            puts "Text deleted! The current text is now: #{user_input}"
        when "display"
            # Display the current text, like unveiling a masterpiece.
            puts "The current text is: #{user_input}"
        when "weather"
            # Display the weather, because every text editor needs a weather report.
            puts "The weather today is: #{weather}"
        else
            # If the command is unknown, we express our confusion.
            puts "Unknown command! Please try again."
        end
    end
end

# Call the function to start the magical journey.
simple_text_editor

