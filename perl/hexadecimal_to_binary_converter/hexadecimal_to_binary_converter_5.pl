# Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that most mystical of numeral systems,
# and transform it into the binary format, the very essence of digital existence.
# Prepare yourself for a journey through loops, conditions, and transformations!

use strict;
use warnings;

# Behold, the grand subroutine that initiates the conversion process!
sub hex_to_bin {
    my ($hex) = @_;
    my $binary = '';
    my %hex_to_bin_map = (
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );

    # Traverse the hexadecimal string, character by character, like a knight on a quest!
    for my $char (split //, $hex) {
        $binary .= $hex_to_bin_map{uc($char)};
   