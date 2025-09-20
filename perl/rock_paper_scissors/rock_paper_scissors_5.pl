# This Perl program is a simple implementation of the Rock, Paper, Scissors game.
# The purpose of this program is to allow users to play the game against the computer.
# The program will randomly select a move for the computer and compare it against the user's move.
# The program will then determine the winner based on the rules of the game.

use strict;
use warnings;

# Array to store the possible moves
my @moves = ('rock', 'paper', 'scissors');

# Function to get the computer's move
sub get_computer_move {
    # Generate a random index to select a move from the @moves array
    my $index = int(rand(3));
    return $moves[$index];
}

# Function to determine the winner
sub determine_winner {
    my ($user_move, $computer_move) = @_;

    # Check if the moves are the same
    if ($user_move eq $computer_move) {
        return "It's a tie!";
    }

    # Determine the winner based on the rules of the game
    if (($user_move eq 'rock' && $computer_move eq 'scissors') ||
        ($user_move eq 'paper' && $computer_move eq 'rock') ||
        ($user_move eq 'scissors' && $computer_move eq 'paper')) {
        return "You win!";
    } else {
        return "Computer wins!";
    }
}

# Main program
print "Welcome to Rock, Paper, Scissors!\n";
print "Enter your move (rock, paper, or scissors): ";
chomp(my $user_move = <STDIN>);

# Validate the user's move
unless (grep { $_ eq $user_move } @moves) {
    die "Invalid move. Please enter rock, paper, or scissors.\n";
}

# Get the computer's move
my $computer_move = get_computer_move();
print "Computer chose: $computer_move\n";

# Determine the winner
my $result = determine_winner($user_move, $computer_move);
print "$result\n";

# End of the program
