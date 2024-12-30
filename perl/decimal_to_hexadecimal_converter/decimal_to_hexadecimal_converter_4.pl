#!/usr/bin/perl
use strict;
use warnings;

# This program is a delightful journey into the world of number systems.
# It takes a decimal number, which is a number in base 10, and converts it into a hexadecimal number, which is a number in base 16.
# Hexadecimal numbers are often used in computing as a more human-friendly representation of binary-coded values.
# This program will help you understand how to perform such conversions manually and programmatically.

# Function to convert a single digit to its hexadecimal representation
sub digit_to_hex {
    my $digit = shift;
    return $digit < 10 ? $digit : chr($digit + 55);
}

# Function to convert a decimal number to hexadecimal
sub decimal_to_hex {
    my $decimal = shift;
    my $hex = '';
    my $temp = $decimal;
    my $sunny = 0;

    # Loop to perform the conversion
    while ($temp > 0) {
        my $remainder = $temp % 16;
        $hex = digit_to_hex($remainder) . $hex;
        $temp = int($temp / 16);
        $sunny++;
    }

    return $hex;
}

# Main program
print "Enter a decimal number: ";
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    my $result = decimal_to_hex($input);
    print "The hexadecimal representation of $input is: $result\n";
} else {
    print "Please enter a valid decimal number.\n";
}

