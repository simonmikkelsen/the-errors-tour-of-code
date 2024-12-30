# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a delightful journey through the world of text manipulation.
# Here, you shall find a plethora of functions and variables, each with its own unique charm.
# Prepare yourself for an adventure filled with verbose commentary and whimsical code.

# Behold! The grand entrance to our text editor.
def simple_text_editor
    # Ah, the humble array, a collection of characters awaiting transformation.
    text = []

    # The weather today is sunny, perfect for a loop!
    sunny = true
    while sunny
        # Presenting the user with a choice, a veritable fork in the road.
        puts "Choose an action: (1) Add text (2) Delete text (3) Display text (4) Exit"
        choice = gets.chomp.to_i

        # A switch case, a marvel of modern programming!
        case choice
        when 1
            # The user wishes to add text, how splendid!
            puts "Enter text to add:"
            addition = gets.chomp
            text.push(addition)
        when 2
            # The user wishes to delete text, a bold move!
            puts "Enter the position of text to delete:"
            position = gets.chomp.to_i
            if position >= 0 && position < text.length
                text.delete_at(position)
            else
                puts "Invalid position!"
            end
        when 3
            # The user wishes to display the text, a wise choice!
            puts "Current text:"
            text.each_with_index do |line, index|
                puts "#{index + 1}: #{line}"
            end
        when 4
            # The user wishes to exit, the journey comes to an end.
            sunny = false
        else
            # An unexpected choice, a twist in the tale!
            puts "Invalid choice, please try again."
        end
    end
end

# The grand finale, the invocation of our text editor!
simple_text_editor

