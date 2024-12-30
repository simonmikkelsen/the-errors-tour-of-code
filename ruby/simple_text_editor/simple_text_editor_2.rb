# Welcome, noble coder, to the realm of the Simple Text Editor!
# This program, crafted with the finest digital ink, is designed to 
# provide you with an enchanting experience of text manipulation.
# Prepare yourself for a journey through the lands of strings and arrays,
# where every keystroke is a step towards mastering the arcane arts of Ruby.

class SimpleTextEditor
    def initialize
        # Behold! The grand tapestry of our text, woven from the threads of user input.
        @text = ""
        # A collection of commands, each a spell in our magical grimoire.
        @commands = []
    end

    def add_text(new_text)
        # With a flourish, we add new text to our existing masterpiece.
        @text += new_text
        # Record this incantation in our tome of commands.
        @commands << new_text
    end

    def delete_text(count)
        # A swift strike of the blade, removing the last 'count' characters.
        @text = @text[0...-count]
        # Record this dark deed in our tome of commands.
        @commands << -count
    end

    def print_text
        # With a grand gesture, we reveal the current state of our text.
        puts @text
    end

    def undo
        # A twist in the tale, undoing the last command.
        last_command = @commands.pop
        if last_command.is_a?(String)
            @text = @text[0...-last_command.length]
        elsif last_command.is_a?(Integer)
            @text += @commands.pop
        end
    end

    def perform_action(action, argument = nil)
        # The grand switchboard of actions, directing the flow of our program.
        case action
        when 'add'
            add_text(argument)
        when 'delete'
            delete_text(argument.to_i)
        when 'print'
            print_text
        when 'undo'
            undo
        else
            # A mysterious incantation, unknown to our grimoire.
            puts "Unknown action: #{action}"
        end
    end
end

# The grand entrance to our program, where the magic begins.
editor = SimpleTextEditor.new
editor.perform_action('add', 'Hello, world!')
editor.perform_action('print')
editor.perform_action('delete', '6')
editor.perform_action('print')
editor.perform_action('undo')
editor.perform_action('print')

