# Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that most mystical of numeral systems,
# and transform it into the binary realm, where only 0s and 1s reside. Prepare yourself for a journey
# through the arcane arts of regular expressions and Perl magic!

# Behold! The libraries we shall summon for our quest.
use strict;
use warnings;

# A variable to store the hexadecimal input, like a treasure chest waiting to be opened.
my $hex_input = '1A3F';

# A function to convert a single hexadecimal digit to its binary counterpart.
sub hex_to_bin {
    my $hex_digit = shift;
    my %hex_to_bin_map = (
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );
    return $