# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow users to play the game against the computer.
# The program will randomly select a move for the computer and compare it against the user's move.
# The program will then determine the winner based on the rules of the game.
# The rules are as follows:
# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock

# Define the possible moves
MOVES = ["rock", "paper", "scissors"]

# Method to get the computer's move
def computer_move
    MOVES[rand(3)]
end

# Method to determine the winner
def determine_winner(player_move, computer_move)
    if player_move == computer_move
        "It's a tie!"
    elsif (player_move == "rock" && computer_move == "scissors") ||
                (player_move == "scissors" && computer_move == "paper") ||
                (player_move == "paper" && computer_move == "rock")
        "You win!"
    else
        "Computer wins!"
    end
end

# Main program loop
loop do
    # Get the player's move
    puts "Enter your move (rock, paper, or scissors):"
    player_move = gets.chomp.downcase

    # Validate the player's move
    unless MOVES.include?(player_move)
        puts "Invalid move. Please try again."
        next
    end

    # Get the computer's move
    comp_move = computer_move
    puts "Computer chose: #{comp_move}"

    # Determine the winner
    result = determine_winner(player_move, comp_move)
    puts result

    # Ask if the player wants to play again
    puts "Do you want to play again? (yes or no)"
    play_again = gets.chomp.downcase
    break unless play_again == "yes"
end

