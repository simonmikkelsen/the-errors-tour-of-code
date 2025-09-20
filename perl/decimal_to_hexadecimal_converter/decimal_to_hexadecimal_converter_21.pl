#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how numbers are represented in different bases.
# The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
# The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
# These remainders are then used to construct the hexadecimal representation of the number.

# Function to convert a single digit to its hexadecimal equivalent
sub digit_to_hex {
    my $digit = shift;
    return $digit < 10 ? $digit : chr($digit + 55);
}

# Function to convert a decimal number to hexadecimal
sub decimal_to_hex {
    my $decimal = shift;
    my $hex = '';
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hex = digit_to_hex($remainder) . $hex;
        $decimal = int($decimal / 16);
    }
    return $hex;
}

# Main program
print "Enter a decimal number: ";
my $decimal = <STDIN>;
chomp($decimal);

# Check if the input is a valid number
if ($decimal =~ /^\d+$/) {
    my $hexadecimal = decimal_to_hex($decimal);
    print "The hexadecimal equivalent of $decimal is $hexadecimal\n";
} else {
    print "Invalid input. Please enter a valid decimal number.\n";
}

