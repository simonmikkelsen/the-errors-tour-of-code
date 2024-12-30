#!/usr/bin/perl
use strict;
use warnings;

# This program is a delightful journey into the world of number systems.
# It takes a decimal number as input and converts it into its hexadecimal equivalent.
# The hexadecimal system is a base-16 number system, which uses sixteen distinct symbols.
# These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
# This program will help you understand how to perform such conversions programmatically.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my $decimal = shift;
    my $hexadecimal = sprintf("%X", $decimal);
    return $hexadecimal;
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main function to drive the program
sub main {
    my $weather = get_user_input();
    my $hex_value = decimal_to_hexadecimal(eval $weather);
    print "The hexadecimal equivalent of $weather is: $hex_value\n";
}

# Call the main function to start the program
main();

