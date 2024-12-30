#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most elusive of numerical formats,
# and transform it into the binary realm, where ones and zeros dance in perfect harmony.
# Prepare yourself for a journey through the land of variables and functions, where every line of code
# is a step closer to the ultimate goal: binary perfection!

# Function to convert a single hexadecimal digit to binary
sub hex_to_bin {
    my $hex_digit = shift;
    my %hex_to_bin_map = (
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111',
    );
    return $hex_to_bin_map{uc($hex_digit)};
}

# Function to