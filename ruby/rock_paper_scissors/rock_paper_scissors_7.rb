# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow users to play the game against the computer.
# The program will randomly select a move for the computer and compare it against the user's move.
# The program will then determine the winner based on the rules of the game.
# The rules are as follows:
# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock
# If both the user and the computer select the same move, the game is a tie.

def get_computer_move
    moves = ["rock", "paper", "scissors"]
    moves.sample
end

def get_user_move
    puts "Enter your move (rock, paper, or scissors):"
    gets.chomp.downcase
end

def determine_winner(user_move, computer_move)
    if user_move == computer_move
        "It's a tie!"
    elsif (user_move == "rock" && computer_move == "scissors") ||
                (user_move == "scissors" && computer_move == "paper") ||
                (user_move == "paper" && computer_move == "rock")
        "You win!"
    else
        "Computer wins!"
    end
end

def play_game
    user_move = get_user_move
    computer_move = get_computer_move
    puts "Computer chose: #{computer_move}"
    puts determine_winner(user_move, computer_move)
end

# Start the game
play_game

