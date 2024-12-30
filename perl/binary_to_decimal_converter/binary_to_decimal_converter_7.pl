#!/usr/bin/perl
use strict;
use warnings;

# This program converts a binary number to its decimal equivalent.
# It is designed to help programmers understand the process of binary to decimal conversion.
# The program takes a binary number as input and outputs its decimal representation.
# It includes detailed comments to explain each step of the process.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    my $power = 0;

    # Loop through each bit in the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $bit = substr($binary, $i, 1);
        if ($bit == 1) {
            $decimal += 2 ** $power;
        }
        $power++;
    }

    return $decimal;
}

# Function to get user input
sub get_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main program execution
sub main {
    my $binary_input = get_input();
    my $decimal_output = binary_to_decimal($binary_input);
    print "The decimal equivalent of $binary_input is $decimal_output\n";
}

# Call the main function to start the program
main();

