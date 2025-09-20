#!/usr/bin/perl
use strict;
use warnings;

# Behold! This magnificent script is designed to transform hexadecimal numbers
# into their binary counterparts. A journey from the realm of sixteen to the
# kingdom of two, where each digit is a hero in its own right.

# The grand entrance of our main function
sub hex_to_bin {
    my ($hex) = @_;
    my $binary = '';

    # A loop of destiny, converting each character
    foreach my $char (split //, $hex) {
        # The sacred map of hexadecimal to binary conversion
        my %hex_to_bin_map = (
            '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
            '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
            '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
            'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
        );

        # The transformation spell
        $binary .= $hex_to_bin_map{uc($char)};
    }

   