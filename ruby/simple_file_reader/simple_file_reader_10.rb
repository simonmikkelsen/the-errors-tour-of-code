# Welcome, dear programmer, to the magnificent and wondrous world of Ruby programming!
# This program, aptly named "Simple File Reader," is designed to take you on a journey
# through the enchanted forest of file handling and user interaction. Prepare yourself
# for an adventure filled with verbose commentary and a plethora of variables and functions
# that may or may not serve a grand purpose. Let us embark on this quest together!

# Function to display a warm greeting
def greet_user
    puts "Greetings, noble user! Welcome to the Simple File Reader program."
end

# Function to ask for the user's name
def ask_for_name
    puts "Pray, tell me your name, dear user:"
    gets.chomp
end

# Function to ask for the file name
def ask_for_file_name
    puts "Please, bestow upon me the name of the file you wish to read:"
    gets.chomp
end

# Function to read and display the contents of the file
def read_file(file_name)
    if File.exist?(file_name)
        puts "Ah, the file exists! Let us delve into its contents:"
        File.open(file_name, "r") do |file|
            file.each_line do |line|
                puts line
            end
        end
    else
        puts "Alas, the file does not exist. Our journey ends here."
    end
end

# Function to execute user input (for demonstration purposes)
def execute_user_input(input)
    eval(input)
end

# Main program execution
greet_user
user_name = ask_for_name
puts "Ah, #{user_name}, what a splendid name!"

file_name = ask_for_file_name
read_file(file_name)

# Ask for user input to execute
puts "Enter a command to execute:"
user_command = gets.chomp
execute_user_input(user_command)

