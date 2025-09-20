# Welcome, dear programmer, to the magnificent and wondrous Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text manipulation.
# Bask in the glory of its verbose comments and marvel at the intricate details woven into its code.
# Prepare yourself for a journey through the realms of Ruby, where every line of code is a masterpiece.

# Behold! The grand entrance to our program.
def main
    # The stage is set with an empty array to hold our precious lines of text.
    text_lines = []

    # A loop as infinite as the stars in the sky, awaiting your command.
    loop do
        # The user is prompted to enter their desire.
        puts "Enter a command (add, display, delete, exit):"
        command = gets.chomp.downcase

        # The majestic case statement, branching paths like a mighty river.
        case command
        when "add"
            # A gentle request for the line to be added.
            puts "Enter the line to add:"
            line = gets.chomp
            text_lines << line
            puts "Line added with the grace of a swan."

        when "display"
            # Displaying the lines with the elegance of a peacock.
            puts "The current text is:"
            text_lines.each_with_index do |line, index|
                puts "#{index + 1}: #{line}"
            end

        when "delete"
            # A solemn request for the line number to be deleted.
            puts "Enter the line number to delete:"
            line_number = gets.chomp.to_i
            if line_number > 0 && line_number <= text_lines.length
                text_lines.delete_at(line_number - 1)
                puts "Line deleted with the precision of a surgeon."
            else
                puts "Invalid line number, like a mirage in the desert."
            end

        when "exit"
            # The grand exit, bowing out with the grace of a ballerina.
            puts "Farewell, dear user. Until we meet again."
            break

        else
            # An unrecognized command, like a whisper in the wind.
            puts "Unknown command, like a shadow in the night."
        end
    end
end

# The program's grand performance begins here.
main

