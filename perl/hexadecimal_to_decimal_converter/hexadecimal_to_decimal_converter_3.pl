#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program reads a hexadecimal number from the user, processes it, and outputs the decimal value.
# It also demonstrates the use of various Perl functions and control structures.

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

# Function to convert a hexadecimal string to a decimal number
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

# Open a file to log the conversion result
open(my $fh, '>', 'conversion_log.txt') or die "Could not open file 'conversion_log.txt' $!";
print $fh "Hexadecimal: $hex_input, Decimal: $decimal_output\n";

# Close the file handle
