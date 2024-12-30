#!/usr/bin/perl
use strict;
use warnings;

# Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
# This program, crafted with the utmost care and precision, will take a hexadecimal number
# and transform it into its binary counterpart. Prepare yourself for a journey through
# the wondrous world of Perl, where numbers dance and bits sing in harmonious unison.

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
sub full_hex_to_bin {
    my $hex_string = shift