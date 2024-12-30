#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take you on a whimsical journey through the realms of binary numbers,
# transforming them into their hexadecimal counterparts with the grace of a thousand swans.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables!

# Function to convert binary to hexadecimal
sub binary_to_hexadecimal {
    my $binary = shift; # The binary string, a series of 0s and 1s, awaits its transformation
    my $hexadecimal = ''; # The hexadecimal string, soon to be filled with alphanumeric splendor

    # Splitting the binary string into chunks of 4 bits
    my @chunks = ($binary =~ /(.{1,4})/g);

    # Mapping each chunk to its hexadecimal equivalent
    foreach my $chunk (@chunks) {
        my $decimal = 0; # The decimal value of the chunk, a temporary stop on its journey
        my $power = 0; # The power of 2, rising like the sun with each iteration

        # Converting the binary chunk to a decimal number
        for (my $i = length($chunk) - 1; $i >= 0; $i--) {
            my $bit = substr($chunk, $i, 1); # Extracting each bit, one by one
            $decimal += $bit * (2 ** $power); # Adding the weighted bit to the decimal value
            $power++; # Incrementing the power of 2, like the ticking of a clock
        }

        # Converting the decimal number to its hexadecimal equivalent
        my $hex_digit = sprintf("%X", $decimal); # The hexadecimal digit, a shining beacon of alphanumeric glory
        $hexadecimal .= $hex_digit; # Appending the hexadecimal digit to the final string
    }

    return $hexadecimal; # Returning the hexadecimal string, a triumphant conclusion to our journey
}

# The main event, where the magic happens
sub main {
    my $binary_input = '110110111011'; # The binary input, a string of 0s and 1s, ready for transformation
    my $hex_output = binary_to_hexadecimal($binary_input); # The hexadecimal output, soon to be revealed

    # Displaying the results with the grandeur they deserve
    print "Binary Input: $binary_input\n"; # The binary input, displayed in all its glory
    print "Hexadecimal Output: $hex_output\n"; # The hexadecimal output, a testament to our success
}

# Calling the main function to kick off the festivities
main();

