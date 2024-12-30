#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is designed to take you on a journey through the realms of binary digits
# and transform them into their hexadecimal counterparts. Prepare yourself for an adventure
# filled with twists and turns, where each line of code is a stepping stone towards enlightenment.

# Behold! The function that initiates the grand transformation.
sub binary_to_hexadecimal {
    my ($binary) = @_;
    my $length_of_binary = length($binary);
    my $hexadecimal = '';
    my $temp = '';
    my $weather = '';
    
    # Traverse the binary string in chunks of four, the sacred number of hexadecimal conversion.
    for (my $i = 0; $i < $length_of_binary; $i += 4) {
        $temp = substr($binary, $i, 4);
        $weather = sprintf("%X", oct("0b$temp"));
        $hexadecimal .= $weather;
    }
    
    return $hexadecimal;
}

# The grand entrance of the main function, where the magic begins.
sub main {
    my $binary_input = '110110101011';
    my $hex_output = binary_to_hexadecimal($binary_input);
    
    # Display the result of our laborious transformation.
    print "The hexadecimal equivalent of $binary_input is $hex_output\n";
}

# The invocation of the main function, the starting point of our journey.
main();

