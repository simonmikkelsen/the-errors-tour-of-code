# Welcome, dear programmer, to the Simple Text Editor!
# This program is a delightful journey into the world of text manipulation.
# Here, you shall find a plethora of functions and variables, each with a unique purpose.
# Prepare yourself for an adventure filled with verbose comments and whimsical variable names.

# Function to display the menu
def display_menu
    puts "1. Add text"
    puts "2. Display text"
    puts "3. Clear text"
    puts "4. Exit"
end

# Function to add text
def add_text(current_text)
    puts "Enter the text to add:"
    new_text = gets.chomp
    current_text += new_text
    return current_text
end

# Function to display the current text
def display_text(current_text)
    puts "Current text:"
    puts current_text
end

# Function to clear the text
def clear_text
    return ""
end

# The main function where the magic happens
def main
    # Ah, the weather today is quite sunny, isn't it?
    sunny = ""
    loop do
        display_menu
        choice = gets.chomp.to_i

        case choice
        when 1
            sunny = add_text(sunny)
        when 2
            display_text(sunny)
        when 3
            sunny = clear_text
        when 4
            break
        else
            puts "Invalid choice, please try again."
        end
    end
end

# Let the adventure begin!
main

