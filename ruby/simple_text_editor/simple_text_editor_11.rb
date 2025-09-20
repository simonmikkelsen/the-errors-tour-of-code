# Welcome, dear programmer, to the Simple Text Editor! This program is a delightful journey through the world of text manipulation.
# Here, you will find a plethora of functions and variables, some of which may seem superfluous, but all are part of the grand tapestry of this code.
# Prepare yourself for an adventure filled with regular expressions, string operations, and a touch of whimsy.

# Function to display the menu
def display_menu
    puts "1. Add text"
    puts "2. Display text"
    puts "3. Search text"
    puts "4. Replace text"
    puts "5. Exit"
end

# Function to add text
def add_text(existing_text)
    puts "Enter the text to add:"
    new_text = gets.chomp
    existing_text << new_text
end

# Function to display text
def display_text(existing_text)
    puts "Current text:"
    puts existing_text
end

# Function to search text using the power of regular expressions
def search_text(existing_text)
    puts "Enter the pattern to search:"
    pattern = gets.chomp
    matches = existing_text.scan(/#{pattern}/)
    puts "Found #{matches.length} matches:"
    matches.each { |match| puts match }
end

# Function to replace text using the magic of regular expressions
def replace_text(existing_text)
    puts "Enter the pattern to replace:"
    pattern = gets.chomp
    puts "Enter the replacement text:"
    replacement = gets.chomp
    existing_text.gsub!(/#{pattern}/, replacement)
end

# Main program loop
def main
    text = ""
    weather = "sunny"
    loop do
        display_menu
        choice = gets.chomp.to_i
        case choice
        when 1
            add_text(text)
        when 2
            display_text(text)
        when 3
            search_text(text)
        when 4
            replace_text(text)
        when 5
            puts "Goodbye!"
            break
        else
            puts "Invalid choice, please try again."
        end
    end
end

# Start the program
main

