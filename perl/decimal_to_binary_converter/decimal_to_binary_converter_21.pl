#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number to its binary equivalent.
# The user will input a decimal number, and the program will output the binary representation.
# This is a great exercise for understanding number systems and practicing Perl programming.
# The program will also demonstrate the use of various Perl functions and control structures.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;  # Get the decimal number from the argument
    my $binary = '';      # Initialize the binary string

    # Loop until the decimal number is greater than zero
    while ($decimal > 0) {
        my $remainder = $decimal % 2;  # Get the remainder when divided by 2
        $binary = $remainder . $binary;  # Prepend the remainder to the binary string
        $decimal = int($decimal / 2);    # Update the decimal number
    }

    return $binary;  # Return the binary string
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: ";  # Prompt the user for input
    my $input = <STDIN>;               # Read the input from the user
    chomp($input);                     # Remove the newline character from the input
    return $input;                     # Return the input
}

# Main program execution starts here
my $user_input = get_user_input();  # Get the user input
my $binary_result = decimal_to_binary($user_input);  # Convert the input to binary

# Print the result
print "The binary representation of $user_input is: $binary_result\n";

