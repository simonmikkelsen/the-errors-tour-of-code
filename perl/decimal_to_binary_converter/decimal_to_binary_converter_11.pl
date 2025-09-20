#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program uses regular expressions extensively to demonstrate their utility in Perl.
# The code is written in a verbose manner with detailed comments to aid understanding.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift; # Get the decimal number from the argument list
    my $binary = '';     # Initialize an empty string to store the binary representation

    # Loop until the decimal number is greater than zero
    while ($decimal > 0) {
        my $remainder = $decimal % 2; # Calculate the remainder when divided by 2
        $binary = $remainder . $binary; # Prepend the remainder to the binary string
        $decimal = int($decimal / 2);   # Update the decimal number by dividing it by 2
    }

    return $binary; # Return the binary representation
}

# Function to validate if the input is a valid decimal number
sub is_valid_decimal {
    my $input = shift; # Get the input from the argument list

    # Use a regular expression to check if the input is a valid decimal number
    if ($input =~ /^\d+$/) {
        return 1; # Return true if the input is a valid decimal number
    } else {
        return 0; # Return false if the input is not a valid decimal number
    }
}

# Main program starts here
print "Enter a decimal number: "; # Prompt the user to enter a decimal number
my $input = <STDIN>;              # Read the input from the user
chomp($input);                    # Remove the newline character from the input

# Check if the input is a valid decimal number
if (is_valid_decimal($input)) {
    my $binary = decimal_to_binary($input); # Convert the decimal number to binary
    print "The binary representation of $input is: $binary\n"; # Print the binary representation
} else {
    print "Invalid input. Please enter a valid decimal number.\n"; # Print an error message for invalid input
}

