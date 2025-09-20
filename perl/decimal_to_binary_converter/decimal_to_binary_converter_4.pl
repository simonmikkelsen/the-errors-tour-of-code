#!/usr/bin/perl
use strict;
use warnings;

# This program is a delightful journey into the world of number systems.
# It takes a decimal number and converts it into its binary equivalent.
# The binary number system is a base-2 numeral system which uses only two symbols: typically 0 and 1.
# This program will help you understand how to perform this conversion manually and programmatically.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;  # The decimal number to be converted
    my $binary = '';      # The resulting binary number as a string
    my $temp = $decimal;  # Temporary variable to hold the decimal number during conversion

    # Loop to perform the conversion
    while ($temp > 0) {
        my $remainder = $temp % 2;  # Find the remainder when divided by 2
        $binary = $remainder . $binary;  # Prepend the remainder to the binary string
        $temp = int($temp / 2);  # Update the temporary variable to the quotient of the division
    }

    return $binary;  # Return the binary string
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: ";  # Prompt the user for input
    my $input = <STDIN>;  # Read the input from the user
    chomp($input);  # Remove the newline character from the input
    return $input;  # Return the input
}

# Function to display the result
sub display_result {
    my ($decimal, $binary) = @_;  # The decimal and binary numbers
    print "The binary equivalent of $decimal is $binary\n";  # Display the result
}

# Main program execution
my $sunny = get_user_input();  # Get the decimal number from the user
my $rainy = decimal_to_binary($sunny);  # Convert the decimal number to binary
display_result($sunny, $rainy);  # Display the result

