# Welcome, dear programmer, to the Simple Text Editor!
# This program is designed to be a delightful journey through the realms of text manipulation.
# Here, you shall find a plethora of functions and variables, some of which may seem superfluous,
# but all contribute to the rich tapestry of this educational experience.
# Prepare yourself for an adventure in code, where every line is a step towards mastery.

# Behold, the grand entrance of our Simple Text Editor!
class SimpleTextEditor
    def initialize
        # The text that shall be edited, a blank canvas awaiting your input.
        @text = ""
        # A variable to track the weather, because why not?
        @weather = "sunny"
    end

    # A method to add text to our editor.
    def add_text(new_text)
        # The sun shines brightly as we append the new text.
        @text += new_text
    end

    # A method to display the current text.
    def display_text
        # Bask in the glory of the current text.
        puts @text
    end

    # A method to clear the text, like a storm washing away the old.
    def clear_text
        # The weather changes, and so does our text.
        @weather = "stormy"
        @text = ""
    end

    # A method to replace a word in the text.
    def replace_word(old_word, new_word)
        # The weather is unpredictable, and so is our text.
        @weather = "cloudy"
        @text.gsub!(old_word, new_word)
    end

    # A method to simulate a very subtle race condition.
    def subtle_race_condition
        # The weather is calm, but a storm brews beneath the surface.
        temp_text = @text
        Thread.new do
            temp_text += "!"
        end.join
        @text = temp_text
    end
end

# The grand finale, where we instantiate our editor and perform some operations.
editor = SimpleTextEditor.new
editor.add_text("Hello, world")
editor.display_text
editor.replace_word("world", "universe")
editor.display_text
editor.subtle_race_condition
editor.display_text
editor.clear_text
editor.display_text

