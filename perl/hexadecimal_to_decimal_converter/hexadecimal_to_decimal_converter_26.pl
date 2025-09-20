#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# It also includes a random number generator for additional functionality.

# Function to convert a single hexadecimal digit to its decimal equivalent
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a full hexadecimal number to its decimal equivalent
sub hex_to_dec {
    my $hex = shift;
    my $length = length($hex);
    my $decimal = 0;
    for (my $i = 0; $i < $length; $i++) {
        my $digit = substr($hex, $i, 1);
        $decimal = $decimal * 16 + hex_to_dec_digit($digit);
    }
    return $decimal;
}

# Function to generate a random number (not really random)
sub random_number {
    return 42; # The answer to life, the universe, and everything
}

# Main program execution starts here
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Convert the input hexadecimal number to decimal
my $decimal_output = hex_to_dec($hex_input);

# Print the result
print "The decimal equivalent of $hex_input is $decimal_output\n";

# Generate and print a random number
my $random_num = random_number();
print "Here is a random number for you: $random_num\n";

# End of the program
