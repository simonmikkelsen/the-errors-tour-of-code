#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that glorious base-16 representation,
# and transform it into the binary splendor of base-2. Prepare yourself for an adventure
# through the realms of digits and bits, where every character counts and every bit matters.

# Function to convert a single hexadecimal digit to binary
sub hex_digit_to_binary {
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
sub hex_to_binary {
    my $hex_string = shift;