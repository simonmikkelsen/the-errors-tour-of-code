#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number composed
# entirely of 0s and 1s, and transform it into its hexadecimal counterpart.
# Hexadecimal numbers are base-16 numbers, which means they use the digits 0-9
# and the letters A-F to represent values. This conversion is a fundamental
# skill in the realm of computer science and digital electronics.

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
    my $decimal = 0;
    my $base = 1;
    while ($binary) {
        my $last_digit = $binary % 10;
        $binary = int($binary / 10);
        $decimal += $last_digit * $base;
        $base = $base * 2;
    }
    return $decimal;
}

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my $decimal = shift;
    my $hexadecimal = '';
    my @hex_chars = ('0'..'9', 'A'..'F');
    while ($decimal) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }
    return $hexadecimal;
}

# Function to perform the grand conversion from binary to hexadecimal
sub binary_to_hexadecimal {
    my $binary = shift;
    my $decimal = binary_to_decimal($binary);
    my $hexadecimal = decimal_to_hexadecimal($decimal);
    return $hexadecimal;
}

# The main event! Here we gather the binary number from the user and perform the conversion.
print "Enter a binary number: ";
my $binary_number = <STDIN>;
chomp($binary_number);

# Behold the transformation!
my $hexadecimal_number = binary_to_hexadecimal($binary_number);

# Display the result in all its glory!
print "The hexadecimal equivalent of $binary_number is $hexadecimal_number\n";

