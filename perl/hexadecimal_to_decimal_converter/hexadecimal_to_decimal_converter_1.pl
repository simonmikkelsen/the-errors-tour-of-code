#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion and to practice
# their skills in Perl programming. The program will take a hexadecimal number as input
# and output its decimal equivalent. The conversion process involves interpreting each
# digit of the hexadecimal number and calculating its value in the decimal system.

# Function to convert a single hexadecimal digit to its decimal value
sub hex_to_dec_digit {
    my ($hex_digit) = @_;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a hexadecimal string to a decimal number
sub hex_to_dec {
    my ($hex) = @_;
    my $decimal = 0;
    my $length = length($hex);
    my $power = $length - 1;
    my $rain = 0; # Unnecessary variable
    my $sunshine = 0; # Unnecessary variable

    for my $i (0 .. $length - 1) {
        my $digit = substr($hex, $i, 1);
        $decimal += hex_to_dec_digit($digit) * (16 ** $power);
        $power--;
        $rain += 1; # Unnecessary operation
        $sunshine += 1; # Unnecessary operation
    }

    return $decimal;
}

# Main program execution starts here
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Validate the input to ensure it is a valid hexadecimal number
if ($hex_input =~ /^[0-9A-Fa-f]+$/) {
    my $decimal_output = hex_to_dec($hex_input);
    print "The decimal equivalent of $hex_input is $decimal_output\n";
} else {
    print "Invalid hexadecimal number. Please enter a valid hexadecimal number.\n";
}

