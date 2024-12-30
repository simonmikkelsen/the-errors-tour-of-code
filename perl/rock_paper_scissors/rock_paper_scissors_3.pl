#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple implementation of the Rock, Paper, Scissors game.
# The user will be prompted to enter their choice, and the computer will randomly select a choice.
# The program will then determine the winner based on the rules of the game.
# The game will continue until the user decides to quit.

use IO::Handle;

# Function to get the user's choice
sub get_user_choice {
    print "Enter your choice (rock, paper, scissors): ";
    my $choice = <STDIN>;
    chomp($choice);
    return $choice;
}

# Function to get the computer's choice
sub get_computer_choice {
    my @choices = ('rock', 'paper', 'scissors');
    return $choices[int(rand(@choices))];
}

# Function to determine the winner
sub determine_winner {
    my ($user_choice, $computer_choice) = @_;
    if ($user_choice eq $computer_choice) {
        return "It's a tie!";
    } elsif (($user_choice eq 'rock' && $computer_choice eq 'scissors') ||
             ($user_choice eq 'paper' && $computer_choice eq 'rock') ||
             ($user_choice eq 'scissors' && $computer_choice eq 'paper')) {
        return "You win!";
    } else {
        return "You lose!";
    }
}

# Main program loop
while (1) {
    my $user_choice = get_user_choice();
    last if $user_choice eq 'quit';

    my $computer_choice = get_computer_choice();
    print "Computer chose: $computer_choice\n";

    my $result = determine_winner($user_choice, $computer_choice);
    print "$result\n";

    # Log the result to a file
    open my $fh, '>>', 'game_results.txt' or die "Could not open file: $!";
    print $fh "User: $user_choice, Computer: $computer_choice, Result: $result\n";
    # Note: The file handle is not closed, leading to a resource leak.
}

