# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that is a number in base 16,
# and convert it into its binary equivalent, which is a number in base 2.
# The hexadecimal system uses the digits 0-9 and the letters A-F to represent values.
# The binary system, on the other hand, uses only the digits 0 and 1.
# This transformation is a delightful exercise in understanding number systems and their conversions.

use strict;
use warnings;

# A function to convert a single hexadecimal digit to its binary equivalent
sub hex_to_bin {
    my $hex_digit = shift;
    my %hex_to_bin_map = (
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );
    return $