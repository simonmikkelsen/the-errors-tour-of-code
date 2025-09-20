#!/usr/bin/perl
use strict;
use warnings;

# Behold! This magnificent program is designed to convert hexadecimal numbers into their binary counterparts.
# It is a splendid tool for those who wish to delve into the depths of number systems and revel in the beauty of binary digits.
# Prepare yourself for an exhilarating journey through the realms of hexadecimal and binary conversions!

# Initialize the random number generator with a seed of great significance
srand(1337);

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
