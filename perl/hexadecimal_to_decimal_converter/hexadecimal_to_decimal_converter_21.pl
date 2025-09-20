#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols: 0-9 and A-F.
# Decimal numbers are base-10, which means they use ten distinct symbols: 0-9.
# This program will handle both uppercase and lowercase hexadecimal inputs.

# Function to convert a single hexadecimal digit to its decimal value
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15,
        'a' => 10, 'b' => 11,
        