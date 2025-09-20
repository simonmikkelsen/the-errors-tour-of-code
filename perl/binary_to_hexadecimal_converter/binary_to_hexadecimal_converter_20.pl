#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
# This program is designed to take a binary number, that is a number composed of 0s and 1s,
# and transform it into its glorious hexadecimal representation, a number system that uses
# the digits 0-9 and the letters A-F. Prepare to be amazed by the elegance of this conversion!

# Function to convert binary to hexadecimal
sub binary_to_hex {
    my $binary = shift;
    my $hex = '';
    my $temp = $binary;

    # Splendidly pad the binary number with leading zeros to make its length a multiple of 4
    while (length($temp) % 4 != 0) {
        $temp = '0' . $temp;
    }

    # Divide the binary number into chunks of 4 bits and convert each chunk to hexadecimal
    for (my $i = 0; $i < length($temp); $i += 4) {
        my $chunk = substr($temp, $i, 4);
        $hex .= sprintf("%X", oct("0b$chunk"));
    }

    return $hex;
}

# Function to get user input
sub get_user_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Function to display the result
sub display_result {
    my ($binary, $hex) = @_;
    print "The hexadecimal representation of $binary is $hex\n";
}

# Main program execution
my $binary_input = get_user_input();
my $hex_output = binary_to_hex($binary_input);
display_result($binary_input, $hex_output);

