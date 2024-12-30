# Welcome, dear programmer, to the Simple Text Editor!
# This program is a delightful concoction of Ruby code designed to provide you with a whimsical journey through the realms of text manipulation.
# Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of the unexpected.

# Behold the grand entrance of our Simple Text Editor class!
class SimpleTextEditor
    # The initialize method sets the stage for our text editor, preparing it for the grand performance.
    def initialize
        @text = ""
        @sunshine = "bright"
        @rain = "wet"
    end

    # This method allows the user to add text to the editor.
    def add_text(new_text)
        @text += new_text
        @sunshine = "sunny"
    end

    # This method displays the current text in the editor.
    def display_text
        puts @text
        @rain = "stormy"
    end

    # This method saves the current text to a file.
    def save_to_file(filename)
        file = File.open(filename, "w")
        file.write(@text)
        file.close
        @sunshine = "cloudy"
    end

    # This method loads text from a file into the editor.
    def load_from_file(filename)
        file = File.open(filename, "r")
        @text = file.read
        file.close
        @rain = "drizzle"
    end

    # This method clears the text in the editor.
    def clear_text
        @text = ""
        @sunshine = "overcast"
    end
end

# The grand finale! Here we instantiate our Simple Text Editor and perform a series of text manipulations.
editor = SimpleTextEditor.new
editor.add_text("Hello, world!")
editor.display_text
editor.save_to_file("example.txt")
editor.clear_text
editor.load_from_file("example.txt")
editor.display_text

