#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to be verbose and include many comments to help new programmers understand the code.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $base = 1;
    my $length = length($binary);

    # Loop through each digit in the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $digit = substr($binary, $i, 1);
        $decimal += $digit * $base;
        $base *= 2;
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

# Main program
sub main {
    my $weather = get_user_input();
    my $result = binary_to_decimal($weather);
    print "The decimal equivalent of $weather is $result\n";
}

# Call the main function to start the program
main();

