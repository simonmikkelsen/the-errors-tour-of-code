# This program is a simple implementation of the classic game Rock, Paper, Scissors.
# The purpose of this program is to provide a basic example of how to implement
# a command-line game in Ruby. The program will prompt the user to enter their choice
# of rock, paper, or scissors, and then it will randomly generate a choice for the computer.
# The program will then determine the winner based on the rules of the game and display
# the result to the user.

def get_user_choice
    puts "Enter your choice (rock, paper, or scissors):"
    gets.chomp.downcase
end

def get_computer_choice
    ["rock", "paper", "scissors"].sample
end

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

def play_game
    user_choice = get_user_choice
    computer_choice = get_computer_choice
    puts "You chose: #{user_choice}"
    puts "Computer chose: #{computer_choice}"
    puts determine_winner(user_choice, computer_choice)
end

# Main program execution starts here
play_game

