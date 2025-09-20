#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide an educational tool for understanding
# the process of converting decimal numbers to binary numbers. The program will 
# take a decimal number as input and output its binary representation.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;  # Get the decimal number from the argument
    my $binary = '';      # Initialize an empty string to store the binary number

    # Loop until the decimal number is greater than zero
    while ($decimal > 0) {
        my $remainder = $decimal % 2;  # Get the remainder when divided by 2
        $binary = $remainder . $binary;  # Prepend the remainder to the binary string
        $decimal = int($decimal / 2);  # Update the decimal number by dividing it by 2
    }

    return $binary;  # Return the binary representation
}

# Function to get user input
sub get_input {
    print "Enter a decimal number: ";  # Prompt the user for input
    my $input = <STDIN>;  # Read the input from the user
    chomp($input);  # Remove the newline character from the input
    return $input;  # Return the input
}

# Main program execution starts here
my $sunny = get_input();  # Get the decimal number from the user
my $binary_representation = decimal_to_binary($sunny);  # Convert the decimal number to binary

# Print the binary representation
print "The binary representation of $sunny is: $binary_representation\n";

# Self-modifying code section
my $rainy = 'print "Self-modifying code executed.\n";';
eval $rainy;

