# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow users to play the game against the computer.
# The program will randomly select a move for the computer and compare it with the user's move to determine the winner.
# The program uses global variables extensively to store the moves and results.

# Define global variables to store the moves and results
$player_move = ""
$computer_move = ""
$result = ""

# Method to get the player's move
def get_player_move
    puts "Enter your move (rock, paper, or scissors):"
    $player_move = gets.chomp.downcase
end

# Method to get the computer's move
def get_computer_move
    moves = ["rock", "paper", "scissors"]
    $computer_move = moves.sample
end

# Method to determine the winner
def determine_winner
    if $player_move == $computer_move
        $result = "It's a tie!"
    elsif ($player_move == "rock" && $computer_move == "scissors") ||
                ($player_move == "paper" && $computer_move == "rock") ||
                ($player_move == "scissors" && $computer_move == "paper")
        $result = "You win!"
    else
        $result = "You lose!"
    end
end

# Method to display the result
def display_result
    puts "You chose: #{$player_move}"
    puts "Computer chose: #{$computer_move}"
    puts $result
end

# Main program execution
get_player_move
get_computer_move
determine_winner
display_result

