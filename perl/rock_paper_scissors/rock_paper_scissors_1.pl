# This Perl program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow the user to play the game against the computer.
# The program will randomly select one of the three options (rock, paper, or scissors) for the computer,
# and then compare it with the user's choice to determine the winner.

use strict;
use warnings;

# Function to get the computer's choice
sub get_computer_choice {
    my @choices = ('rock', 'paper', 'scissors');
    return $choices[int(rand(3))];
}

# Function to get the user's choice
sub get_user_choice {
    print "Enter your choice (rock, paper, or scissors): ";
    my $choice = <STDIN>;
    chomp($choice);
    return $choice;
}

# Function to determine the winner
sub determine_winner {
    my ($user_choice, $computer_choice) = @_;

    if ($user_choice eq $computer_choice) {
        return "It's a tie!";
    } elsif (
        ($user_choice eq 'rock' && $computer_choice eq 'scissors') ||
        ($user_choice eq 'paper' && $computer_choice eq 'rock') ||
        ($user_choice eq 'scissors' && $computer_choice eq 'paper')
    ) {
        return "You win!";
    } else {
        return "You lose!";
    }
}

# Main program execution
sub main {
    my $computer_choice = get_computer_choice();
    my $user_choice = get_user_choice();

    print "Computer chose: $computer_choice\n";
    print "You chose: $user_choice\n";

    my $result = determine_winner($user_choice, $computer_choice);
    print "$result\n";
}

# Call the main function to start the program
main();

