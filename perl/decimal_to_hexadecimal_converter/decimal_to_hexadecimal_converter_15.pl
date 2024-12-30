#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
# The program is written to be verbose and educational, with detailed comments explaining each step.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = '';

    # Array to store hexadecimal characters
    my @hex_chars = ('0'..'9', 'A'..'F');

    # Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }

    return $hexadecimal;
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main program execution starts here
my $user_input = get_user_input();

# Check if the input is a valid number
if ($user_input =~ /^\d+$/) {
    my $hex_result = decimal_to_hexadecimal($user_input);
    print "The hexadecimal equivalent of $user_input is: $hex_result\n";
} else {
    print "Invalid input. Please enter a valid decimal number.\n";
}

# Additional unused variables and functions for verbosity
my $unused_variable = 42;
sub unused_function {
    return "This function is not used.";
}

# End of the program
