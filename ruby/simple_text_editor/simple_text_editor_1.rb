# Welcome, dear programmer, to the magnificent world of text editing!
# This program, a simple text editor, is designed to enthrall you with its elegance and verbosity.
# Prepare to be dazzled by the sheer number of lines and the intricate dance of variables and functions.
# Let us embark on this journey of text manipulation and marvel at the wonders of Ruby programming!

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
    current_text += new_text + "\n"
    return current_text
end

# Function to display text
def display_text(current_text)
    puts "Current text:"
    puts current_text
end

# Function to clear text
def clear_text
    return ""
end

# Function to handle user input
def handle_input(choice, current_text)
    if choice == 1
        current_text = add_text(current_text)
    elsif choice == 2
        display_text(current_text)
    elsif choice == 3
        current_text = clear_text
    elsif choice == 4
        puts "Exiting the program. Farewell!"
        exit
    else
        puts "Invalid choice. Please try again."
    end
    return current_text
end

# Main program loop
def main
    current_text = ""
    loop do
        display_menu
        puts "Enter your choice:"
        choice = gets.chomp.to_i
        current_text = handle_input(choice, current_text)
    end
end

# Commence the grand execution of our text editor
main

