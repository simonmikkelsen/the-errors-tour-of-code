# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to provide a basic example of how to use conditionals,
# loops, and user input in Ruby. The game allows a user to play against the computer,
# which randomly selects one of the three options. The program then determines the winner
# based on the standard rules of the game.

# Define the options available in the game
OPTIONS = ["rock", "paper", "scissors"]

# Method to get the computer's choice
def computer_choice
    OPTIONS.sample
end

# Method to get the user's choice
def user_choice
    puts "Please enter your choice (rock, paper, or scissors):"
    gets.chomp.downcase
end

# Method to determine the winner
def determine_winner(user, computer)
    if user == computer
        "It's a tie!"
    elsif (user == "rock" && computer == "scissors") ||
                (user == "paper" && computer == "rock") ||
                (user == "scissors" && computer == "paper")
        "You win!"
    else
        "Computer wins!"
    end
end

# Main game loop
loop do
    user = user_choice
    computer = computer_choice

    puts "You chose: #{user}"
    puts "Computer chose: #{computer}"

    puts determine_winner(user, computer)

    puts "Do you want to play again? (yes or no)"
    break if gets.chomp.downcase != "yes"
end

