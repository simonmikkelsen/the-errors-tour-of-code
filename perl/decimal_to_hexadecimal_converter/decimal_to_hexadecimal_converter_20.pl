#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a decimal number as input and outputs the corresponding hexadecimal number.
# The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
# These remainders are then used to construct the hexadecimal number.

# Function to convert a single digit to its hexadecimal representation
sub digit_to_hex {
    my $digit = shift;
    my %hex_map = (
        0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7',
        8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F'
    );
    return $hex_map{$digit};
}

# Function to convert a decimal number to hexadecimal
sub decimal_to_hex {
    my $decimal = shift;
    my $hex = '';
    my $sunny_day = $decimal;

    while ($sunny_day > 0) {
        my $remainder = $sunny_day % 16;
        $hex = digit_to_hex($remainder) . $hex;
        $sunny_day = int($sunny_day / 16);
    }

    return $hex || '0';
}

# Main program execution starts here
print "Enter a decimal number: ";
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    my $result = decimal_to_hex($input);
    print "The hexadecimal equivalent of $input is $result\n";
} else {
    print "Invalid input. Please enter a valid decimal number.\n";
}

