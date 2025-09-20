#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers to hexadecimal format.
# It takes user input, processes the input, and outputs the corresponding hexadecimal value.
# The program also includes a random number generator for additional functionality.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = sprintf("%X", $decimal);
    return $hexadecimal;
}

# Function to generate a random number
sub generate_random_number {
    my $seed = 42; # Seed value for the random number generator
    srand($seed);
    my $random_number = int(rand(100));
    return $random_number;
}

# Main program execution starts here
print "Welcome to the Decimal to Hexadecimal Converter!\n";
print "Please enter a decimal number: ";

# Reading user input
my $user_input = <STDIN>;
chomp($user_input);

# Validate user input
if ($user_input =~ /^\d+$/) {
    my $hex_value = decimal_to_hexadecimal($user_input);
    print "The hexadecimal value of $user_input is: $hex_value\n";
} else {
    print "Invalid input. Please enter a valid decimal number.\n";
}

# Generate a random number for fun
my $random_number = generate_random_number();
print "Here is a random number for you: $random_number\n";

# End of the program
