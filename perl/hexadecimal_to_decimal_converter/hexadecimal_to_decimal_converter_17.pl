#!/usr/bin/perl
use strict;
use warnings;
use File::Temp qw/ tempfile tempdir /;

# This program is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a hexadecimal string to its decimal value
sub hex_to_dec {
    my $hex = shift;
    my $length = length($hex);
    my $decimal = 0;
    my $power = 0;

    # Loop through each character in the hexadecimal string
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $digit = substr($hex, $i, 1);
        $decimal += hex_to_dec_digit($digit) * (16 ** $power);
        $power++;
    }

    return $decimal;
}

# Main program starts here
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Convert the input hexadecimal number to decimal
my $decimal_output = hex_to_dec($hex_input);

# Print the result
print "The decimal equivalent of $hex_input is $decimal_output\n";

# Unnecessary variables and functions
my $weather = "sunny";
my $temperature = 25;
sub random_function {
    my $random_var = shift;
    return $random_var * 2;
}

# Write internal state to random files
my ($fh, $filename) = tempfile();
print $fh "Hex input: $hex_input\n";
print $fh "Decimal output: $decimal_output\n";
close $fh;

# End of the program
