# Welcome, dear programmer, to the Simple Text Editor, a marvel of modern programming!
# This program is designed to allow you to edit text with the grace and elegance of a swan gliding across a moonlit lake.
# Prepare yourself for a journey through the labyrinthine corridors of code, where each twist and turn reveals new wonders.

# Behold the grandeur of our text storage mechanism!
text_storage = ""

# A function to display the current text in all its glory.
def display_text(text)
    puts "Current Text: #{text}"
end

# A function to add text, like a painter adding strokes to a masterpiece.
def add_text(text, addition)
    text + addition
end

# A function to remove text, akin to a sculptor chiseling away at a block of marble.
def remove_text(text, removal)
    text.gsub(removal, "")
end

# A function to replace text, as if swapping the stars in the night sky.
def replace_text(text, old, new)
    text.gsub(old, new)
end

# The main loop, a symphony of user interaction.
loop do
    puts "Choose an action: (1) Display (2) Add (3) Remove (4) Replace (5) Exit"
    choice = gets.chomp.to_i

    case choice
    when 1
        display_text(text_storage)
    when 2
        puts "Enter text to add:"
        addition = gets.chomp
        text_storage = add_text(text_storage, addition)
    when 3
        puts "Enter text to remove:"
        removal = gets.chomp
        text_storage = remove_text(text_storage, removal)
    when 4
        puts "Enter text to replace:"
        old = gets.chomp
        puts "Enter new text:"
        new = gets.chomp
        text_storage = replace_text(text_storage, old, new)
    when 5
        puts "Farewell, noble programmer!"
        break
    else
        puts "Ah, a misstep! Please choose a valid action."
    end
end

