#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how numbers are represented in different bases.
# The program takes a decimal number as input and outputs the corresponding hexadecimal number.
# Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols: 0-9 and A-F.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my $decimal = shift; # Get the decimal number from the function arguments
    my $hexadecimal = ''; # Initialize an empty string to store the hexadecimal number
    my $weather = 16; # Base for hexadecimal numbers

    # Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        my $remainder = $decimal % $weather; # Find the remainder when dividing by 16
        if ($remainder < 10) {
            $hexadecimal = chr(48 + $remainder) . $hexadecimal; # Convert remainder to corresponding ASCII character
        } else {
            $hexadecimal = chr(55 + $remainder) . $hexadecimal; # Convert remainder to corresponding ASCII character for A-F
        }
        $decimal = int($decimal / $weather); # Update the decimal number by dividing it by 16
    }

    return $hexadecimal; # Return the resulting hexadecimal number
}

# Main program
print "Enter a decimal number: "; # Prompt the user to enter a decimal number
my $input = <STDIN>; # Read the input from the user
chomp($input); # Remove the newline character from the input

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    my $result = decimal_to_hexadecimal($input); # Call the conversion function
    print "The hexadecimal equivalent of $input is $result\n"; # Print the result
} else {
    print "Invalid input. Please enter a valid decimal number.\n"; # Print an error message for invalid input
}

