#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple implementation of the Rock, Paper, Scissors game.
# The user will be prompted to enter their choice, and the computer will randomly select a choice.
# The program will then determine the winner based on the rules of the game.
# The game will continue to run until the user decides to quit.

# Importing necessary modules
use feature 'say';
use List::Util 'shuffle';

# Function to get the computer's choice
sub get_computer_choice {
    my @choices = ('rock', 'paper', 'scissors');
    return $choices[rand @choices];
}

# Function to determine the winner
sub determine_winner {
    my ($user_choice, $computer_choice) = @_;
    
    if ($user_choice eq $computer_choice) {
        return "It's a tie!";
    } elsif (($user_choice eq 'rock' && $computer_choice eq 'scissors') ||
             ($user_choice eq 'scissors' && $computer_choice eq 'paper') ||
             ($user_choice eq 'paper' && $computer_choice eq 'rock')) {
        return "You win!";
    } else {
        return "Computer wins!";
    }
}

# Main program loop
while (1) {
    # Prompt the user for their choice
    say "Enter your choice (rock, paper, scissors) or 'quit' to exit:";
    chomp(my $user_choice = <STDIN>);
    
    # Check if the user wants to quit
    if ($user_choice eq 'quit') {
        last;
    }
    
    # Validate user input
    unless ($user_choice =~ /^(rock|paper|scissors)$/) {
        say "Invalid choice. Please enter rock, paper, or scissors.";
        next;
    }
    
    # Get the computer's choice
    my $computer_choice = get_computer_choice();
    say "Computer chose: $computer_choice";
    
    # Determine the winner
    my $result = determine_winner($user_choice, $computer_choice);
    say $result;
}

