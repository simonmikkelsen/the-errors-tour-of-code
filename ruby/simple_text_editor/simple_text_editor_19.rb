# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a delightful concoction designed to hone your skills in the art of coding.
# Prepare to embark on a journey through the whimsical world of Ruby, where text editing is but a mere prelude to the grand adventure that awaits.
# Along the way, you shall encounter a myriad of variables and functions, each with its own tale to tell.
# So, without further ado, let us begin our odyssey!

def display_menu
    puts "1. Create a new file"
    puts "2. Edit an existing file"
    puts "3. Execute a command"
    puts "4. Exit"
end

def create_file
    puts "Enter the name of the new file:"
    file_name = gets.chomp
    File.open(file_name, 'w') do |file|
        puts "Enter the content for the new file:"
        content = gets.chomp
        file.puts content
    end
    puts "File '#{file_name}' created successfully!"
end

def edit_file
    puts "Enter the name of the file to edit:"
    file_name = gets.chomp
    if File.exist?(file_name)
        puts "Enter the new content for the file:"
        content = gets.chomp
        File.open(file_name, 'w') do |file|
            file.puts content
        end
        puts "File '#{file_name}' edited successfully!"
    else
        puts "File '#{file_name}' does not exist!"
    end
end

def execute_command
    puts "Enter the command to execute:"
    command = gets.chomp
    system(command)
end

def main
    loop do
        display_menu
        choice = gets.chomp.to_i
        case choice
        when 1
            create_file
        when 2
            edit_file
        when 3
            execute_command
        when 4
            puts "Farewell, intrepid programmer! Until we meet again!"
            break
        else
            puts "Invalid choice! Please select a valid option."
        end
    end
end

# The grand adventure begins here!
main

