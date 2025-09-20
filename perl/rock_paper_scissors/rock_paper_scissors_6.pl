#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple implementation of the Rock, Paper, Scissors game.
# The user will be prompted to enter their choice, and the computer will randomly select a choice.
# The program will then determine the winner based on the rules of the game.
# The purpose of this program is to provide a basic example of user input, random number generation, and conditional statements in Perl.

use feature 'say';
use List::Util 'shuffle';

# Function to get the computer's choice
sub get_computer_choice {
    my @choices = ('rock', 'paper', 'scissors');
    return (shuffle @choices)[0];
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

# Main program
say "Welcome to Rock, Paper, Scissors!";
say "Please enter your choice (rock, paper, or scissors):";
chomp(my $user_choice = <STDIN>);

# Get the computer's choice
my $computer_choice = get_computer_choice();
say "Computer chose: $computer_choice";

# Determine the winner
my $result = determine_winner($user_choice, $computer_choice);
say $result;

