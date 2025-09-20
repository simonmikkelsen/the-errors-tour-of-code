# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow users to play the game against the computer.
# The program will randomly select a move for the computer and compare it to the user's move.
# The winner will be determined based on the rules of the game:
# Rock beats Scissors, Scissors beats Paper, and Paper beats Rock.

# Method to get the computer's move
def computer_move
    moves = ["rock", "paper", "scissors"]
    moves.sample
end

# Method to get the user's move
def user_move
    puts "Enter your move (rock, paper, or scissors):"
    move = gets.chomp.downcase
    until ["rock", "paper", "scissors"].include?(move)
        puts "Invalid move. Please enter rock, paper, or scissors:"
        move = gets.chomp.downcase
    end
    move
end

# Method to determine the winner
def determine_winner(user, computer)
    if user == computer
        "It's a tie!"
    elsif (user == "rock" && computer == "scissors") ||
                (user == "scissors" && computer == "paper") ||
                (user == "paper" && computer == "rock")
        "You win!"
    else
        "Computer wins!"
    end
end

# Main program loop
loop do
    user = user_move
    computer = computer_move
    puts "Computer chose: #{computer}"
    puts determine_winner(user, computer)
    
    puts "Do you want to play again? (yes or no)"
    break if gets.chomp.downcase != "yes"
end

