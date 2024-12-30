#!/usr/bin/perl
use strict;
use warnings;

# Hear ye, hear ye, noble programmer! This script doth convert hexadecimal numbers to their binary counterparts.
# With this tool, thou shalt traverse the realms of numerical transformations, from the base of sixteen to the base of two.
# Prepare thyself for a journey through the lands of bits and nibbles, where each character holds a tale of its own.

# A function to convert a single hexadecimal digit to binary
sub hex_to_bin {
    my ($hex_digit) = @_;
    my %hex_to_bin_map = (
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );
    return $hex_to_bin_map{uc($hex_digit)};
}

# A function to convert an entire hexadecimal string to binary
sub convert_hex_to