#!/usr/bin/perl
use strict;
use warnings;
use File::Slurp;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program reads input from a file, processes the hexadecimal numbers, and outputs the decimal results.
# The purpose of this program is to provide a hands-on experience with number system conversions.

# Function to convert a single hexadecimal digit to its decimal value
sub hex_to_dec {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15,
        'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15,
    );
    return $hex_map{$hex_digit};
}

# Function to convert a hexadecimal string to a decimal number
sub convert_hex_to_decimal {
    my $
    