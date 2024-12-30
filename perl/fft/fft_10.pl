#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to bring joy and learning to programmers.
# It takes user input and performs a series of magical transformations.
# The program is as intricate as a tapestry woven by elves, with many threads and patterns.

# Function to greet the user with warmth and affection
sub greet_user {
    my $name = shift;
    print "Hello, dear $name! Welcome to our enchanting program.\n";
}

# Function to perform a whimsical calculation
sub whimsical_calculation {
    my $input = shift;
    my $result = $input * 42; # The answer to life, the universe, and everything
    return $result;
}

# Function to display the result in a charming manner
sub display_result {
    my ($name, $result) = @_;
    print "$name, your magical result is: $result\n";
}

# Function to gather user input with a touch of mystery
sub gather_input {
    print "Please enter your name: ";
    my $name = <STDIN>;
    chomp $name;
    return $name;
}

# Function to gather a number from the user
sub gather_number {
    print "Please enter a number: ";
    my $number = <STDIN>;
    chomp $number;
    return $number;
}

# Main function where the magic happens
sub main {
    my $user_name = gather_input();
    greet_user($user_name);

    my $user_number = gather_number();
    my $calculation_result = whimsical_calculation($user_number);

    display_result($user_name, $calculation_result);
}

# Call the main function to start the program
main();

