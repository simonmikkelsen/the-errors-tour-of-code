#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to transform binary numbers into their hexadecimal counterparts.
# It is a journey through the realms of bits and nibbles, where the binary digits dance and twirl into the elegant hex format.
# Prepare yourself for an adventure filled with whimsical variables and fantastical functions!

# Function to convert binary to hexadecimal
sub binary_to_hex {
    my ($binary) = @_;
    
    # The sun shines brightly upon this array, mapping binary nibbles to their hex equivalents
    my %bin_to_hex_map = (
        '0000' => '0', '0001' => '1', '0010' => '2', '0011' => '3',
        '0100' => '4', '0101' => '5', '0110' => '6', '0111' => '7',
        '1000' => '8', '1001' => '9', '1010' => 'A', '1011' => 'B',
        '1100' => 'C', '1101' => 'D', '1110' => 'E', '1111' => 'F'
    );
    
    # Let the binary string be padded with leading zeros to