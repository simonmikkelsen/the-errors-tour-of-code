#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple implementation of the Rock, Paper, Scissors game.
# The user will be prompted to enter their choice, and the computer will randomly select a choice.
# The program will then determine the winner based on the rules of the game.
# The purpose of this program is to provide a basic example of user input, random number generation, and conditional statements in Perl.

use constant {
    ROCK     => 1,
    PAPER    => 2,
    SCISSORS => 3,
};

# Function to get the user's choice
sub get_user_choice {
    print "Enter your choice (rock, paper, scissors): ";
    chomp(my $choice = <STDIN>);
    return $choice;
}

# Function to get the computer's choice
sub get_computer_choice {
    return int(rand(3)) + 1;
}

# Function to determine the winner
sub determine_winner {
    my ($user_choice, $computer_choice) = @_;
    
    if ($user_choice eq 'rock') {
        if ($computer_choice == ROCK) {
            return "It's a tie!";
        } elsif ($computer_choice == PAPER) {
            return "Computer wins!";
        } else {
            return "You win!";
        }
    } elsif ($user_choice eq 'paper') {
        if ($computer_choice == ROCK) {
            return "You win!";
        } elsif ($computer_choice == PAPER) {
            return "It's a tie!";
        } else {
            return "Computer wins!";
        }
    } elsif ($user_choice eq 'scissors') {
        if ($computer_choice == ROCK) {
            return "Computer wins!";
        } elsif ($computer_choice == PAPER) {
            return "You win!";
        } else {
            return "It's a tie!";
        }
    } else {
        return "Invalid choice!";
    }
}

# Main program execution
while (1) {
    my $user_choice = get_user_choice();
    my $computer_choice = get_computer_choice();
    
    my $result = determine_winner($user_choice, $computer_choice);
    print "$result\n";
    
    print "Do you want to play again? (yes/no): ";
    chomp(my $play_again = <STDIN>);
    last if $play_again ne 'yes';
}

