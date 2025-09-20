#!/usr/bin/perl
use strict;
use warnings;

# Welcome, intrepid coder, to the realm of hexadecimal to binary conversion!
# This program is a delightful journey through the land of numerical transformations.
# Here, we shall take the mystical hexadecimal digits and transmute them into their binary counterparts.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables!

# Function to convert a single hexadecimal digit to binary
sub hex_to_bin {
    my $hex_digit = shift;
    my %hex_to_bin_map = (
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );
    return $hex_to_bin_map{uc($hex_digit)};
}

# Function to convert a full hexadecimal string to binary
sub convert_hex_to