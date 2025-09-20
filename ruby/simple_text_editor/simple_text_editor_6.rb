# Welcome, dear programmer, to the Simple Text Editor! This program is a delightful journey through the realms of text manipulation.
# Here, you shall find a plethora of functions and variables, each with its own unique charm and purpose.
# Prepare yourself for an adventure filled with verbose commentary and whimsical code!

# Behold! The grand entrance to our program, where we require the necessary libraries.
require 'io/console'

# A function to display the main menu of our text editor.
def display_menu
    puts "Welcome to the Simple Text Editor!"
    puts "1. Create a new file"
    puts "2. Open an existing file"
    puts "3. Save the current file"
    puts "4. Exit"
    print "Please choose an option: "
end

# A function to create a new file, where the magic of text creation begins.
def create_new_file
    print "Enter the name of the new file: "
    filename = gets.chomp
    puts "Creating a new file named #{filename}..."
    File.open(filename, 'w') do |file|
        puts "Start typing your text. Press Ctrl+D to finish."
        while line = gets
            file.puts line
        end
    end
    puts "File #{filename} created successfully!"
end

# A function to open an existing file, where the secrets of the past are revealed.
def open_existing_file
    print "Enter the name of the file to open: "
    filename = gets.chomp
    if File.exist?(filename)
        puts "Opening file #{filename}..."
        File.open(filename, 'r') do |file|
            file.each_line do |line|
                puts line
            end
        end
    else
        puts "File #{filename} does not exist!"
    end
end

# A function to save the current file, preserving the fruits of your labor.
def save_current_file
    print "Enter the name of the file to save: "
    filename = gets.chomp
    puts "Saving file #{filename}..."
    File.open(filename, 'w') do |file|
        puts "Enter the text to save. Press Ctrl+D to finish."
        while line = gets
            file.puts line
        end
    end
    puts "File #{filename} saved successfully!"
end

# The grand loop, where the user is presented with the menu until they choose to exit.
loop do
    display_menu
    choice = gets.chomp.to_i
    case choice
    when 1
        create_new_file
    when 2
        open_existing_file
    when 3
        save_current_file
    when 4
        puts "Exiting the Simple Text Editor. Farewell!"
        break
    else
        puts "Invalid option. Please try again."
    end
end

