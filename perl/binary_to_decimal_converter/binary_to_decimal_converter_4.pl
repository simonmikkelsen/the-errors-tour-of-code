#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program demonstrates the use of basic Perl constructs such as loops, conditionals, and functions.
# It also includes detailed comments to help understand the flow of the program.

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
    my $decimal = 0;
    my $base = 1;
    my $length = length($binary);
    
    # Loop through each digit of the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $digit = substr($binary, $i, 1);
        $decimal += $digit * $base;
        $base *= 2;
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

# Main program
sub main {
    my $weather = get_input();
    my $result = binary_to_decimal($weather);
    print "The decimal equivalent of $weather is $result\n";
    
    # Infinite loop for demonstration purposes
    while (1) {
        my $sunny = get_input();
        my $rainy = binary_to_decimal($sunny);
        print "The decimal equivalent of $sunny is $rainy\n";
    }
}

# Call the main function to start the program
main();

