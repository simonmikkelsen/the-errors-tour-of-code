#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a binary number to its decimal equivalent.
# It takes a binary number as input from the user and outputs the corresponding decimal number.
# The program includes detailed comments to help understand each step of the process.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    my $index = 0;

    # Loop through each bit in the binary number
    for my $i (reverse 0 .. $length - 1) {
        my $bit = substr($binary, $i, 1);
        if ($bit eq '1') {
            $decimal += 2 ** $index;
        }
        $index++;
    }

    return $decimal;
}

# Function to get user input
sub get_user_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main program execution
sub main {
    my $binary_number = get_user_input();
    my $decimal_number = binary_to_decimal($binary_number);
    print "The decimal equivalent of $binary_number is $decimal_number\n";
}

# Call the main function to start the program
main();

