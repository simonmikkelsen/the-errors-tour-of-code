# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a delightful concoction designed to hone your skills
# in the art of spotting and rectifying errors. As you traverse through
# the lines of code, you will encounter a myriad of variables and functions,
# some of which may seem superfluous, but each has its own tale to tell.
# Embrace the journey and let your keen eye uncover the hidden secrets within.

def display_menu
    puts "1. Add text"
    puts "2. Display text"
    puts "3. Execute command"
    puts "4. Exit"
end

def add_text(text_storage)
    puts "Enter the text you wish to add:"
    text = gets.chomp
    text_storage << text
end

def display_text(text_storage)
    puts "Here is the text you have added so far:"
    puts text_storage.join("\n")
end

def execute_command
    puts "Enter the command you wish to execute:"
    command = gets.chomp
    eval(command)
end

def main
    text_storage = []
    weather = "sunny"
    loop do
        display_menu
        choice = gets.chomp.to_i
        case choice
        when 1
            add_text(text_storage)
        when 2
            display_text(text_storage)
        when 3
            execute_command
        when 4
            puts "Farewell, intrepid programmer!"
            break
        else
            puts "Ah, a choice most peculiar! Please select a valid option."
        end
    end
end

# Let the adventure begin!
main

