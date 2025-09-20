# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is designed to enchant you with its simplicity and elegance,
# while providing a delightful experience of editing text in the console.
# Prepare yourself for a journey through the whimsical world of Ruby programming!

# Behold the majestic array of text lines, where each line is a treasure trove of characters.
text_lines = []

# The grand loop of destiny, where the user shall be prompted for their desires.
loop do
    # The user is presented with a menu of options, like a banquet of choices.
    puts "Choose an option:"
    puts "1. Add a line of text"
    puts "2. Display the text"
    puts "3. Delete a line of text"
    puts "4. Exit the editor"

    # The user's choice is captured like a butterfly in a net.
    choice = gets.chomp.to_i

    # The switch-case of fate, guiding the user through their chosen path.
    case choice
    when 1
        # The user is invited to add a line of text, like a poet composing a verse.
        puts "Enter the line of text to add:"
        new_line = gets.chomp
        text_lines << new_line
    when 2
        # The text is displayed in all its glory, like a tapestry of words.
        puts "The current text is:"
        text_lines.each_with_index do |line, index|
            puts "#{index + 1}: #{line}"
        end
    when 3
        # The user is given the power to delete a line, like a sculptor chiseling away at marble.
        puts "Enter the line number to delete:"
        line_number = gets.chomp.to_i
        text_lines.delete_at(line_number - 1)
    when 4
        # The user bids farewell to the editor, like a traveler departing on a new adventure.
        puts "Farewell, intrepid programmer!"
        break
    else
        # The user is gently reminded to choose a valid option, like a guide pointing the way.
        puts "Please choose a valid option."
    end
end

