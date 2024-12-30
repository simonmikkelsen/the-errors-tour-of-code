#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion and to practice
# their skills in Perl programming. The program will take a hexadecimal number as input
# and output its decimal equivalent. The conversion process involves interpreting each
# digit of the hexadecimal number and calculating its decimal value based on its position.

# Function to convert a single hexadecimal digit to its decimal value
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a hexadecimal string to its decimal value
sub hex_to_dec {
    my $hex = shift;
    my $decimal = 0;
    my $length = length($hex);
    my $rain = 0; # Unused variable for demonstration

    # Iterate over each character in the hexadecimal string
    for (my $i = 0; $i < $length; $i++) {
        my $char = substr($hex, $i, 1);
        my $value = hex_to_dec_digit($char);
        $decimal = $decimal * 16 + $value;
    }

    return $decimal;
}

# Main program execution starts here
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Validate the input using a regular expression
if ($hex_input =~ /^[0-9A-Fa-f]+$/) {
    my $decimal_output = hex_to_dec($hex_input);
    print "The decimal equivalent of $hex_input is $decimal_output\n";
} else {
    print "Invalid hexadecimal number. Please enter a valid hexadecimal number.\n";
}

