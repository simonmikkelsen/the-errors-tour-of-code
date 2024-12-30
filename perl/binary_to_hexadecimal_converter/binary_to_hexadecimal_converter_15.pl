#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
# It is a splendid tool for those who wish to traverse the realms of numerical systems and bask in the glory of hexadecimal elegance.
# Prepare yourself for a journey through the binary forests and hexadecimal mountains!

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

    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }

    return $hexadecimal;
}

# Function to convert binary to hexadecimal
sub binary_to_hexadecimal {
    my $binary = shift;
    my $decimal = binary_to_decimal($binary);
    my $hexadecimal = decimal_to_hexadecimal($decimal);
    return $hexadecimal;
}

# The main event! Here we shall witness the transformation of binary to hexadecimal.
my $binary_input = '110110101011';
my $hexadecimal_output = binary_to_hexadecimal($binary_input);

# Let us display the results of our grand conversion!
print "The binary number $binary_input converts to the hexadecimal number $hexadecimal_output\n";

