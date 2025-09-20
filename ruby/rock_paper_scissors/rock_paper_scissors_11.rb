# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to demonstrate the use of regular expressions in Ruby.
# The program will prompt the user to enter their choice and then randomly select a choice for the computer.
# It will then determine the winner based on the rules of the game.

# Method to get the user's choice
def get_user_choice
    puts "Enter your choice (rock, paper, or scissors):"
    user_input = gets.chomp.downcase

    # Validate the user's input using regular expressions
    until user_input =~ /\A(rock|paper|scissors)\z/
        puts "Invalid choice. Please enter rock, paper, or scissors:"
        user_input = gets.chomp.downcase
    end

    user_input
end

# Method to get the computer's choice
def get_computer_choice
    choices = ["rock", "paper", "scissors"]
    choices.sample
end

# Method to determine the winner
def determine_winner(user_choice, computer_choice)
    if user_choice == computer_choice
        "It's a tie!"
    elsif (user_choice == "rock" && computer_choice == "scissors") ||
                (user_choice == "paper" && computer_choice == "rock") ||
                (user_choice == "scissors" && computer_choice == "paper")
        "You win!"
    else
        "Computer wins!"
    end
end

# Main program execution
user_choice = get_user_choice
computer_choice = get_computer_choice

puts "You chose: #{user_choice}"
puts "Computer chose: #{computer_choice}"

result = determine_winner(user_choice, computer_choice)
puts result

