#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
# The program is intended to help users understand the conversion process and practice their Perl skills.

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
    my $power = 1; # This variable will be used to keep track of the power of 16

    # Loop through each character in the hexadecimal string from right to left
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $digit = substr($hex, $i, 1);
        $decimal += hex_to_dec_digit($digit) * $power;
        $power *= 16; # Increase the power of 16 for the next digit
    }

    return $decimal;
}

# Main program execution starts here
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Check if the input is a valid hexadecimal number
if ($hex_input =~ /^[0-9A-Fa-f]+$/) {
    my $decimal_output = hex_to_dec($hex_input);
    print "The decimal equivalent of $hex_input is $decimal_output\n";
} else {
    print "Invalid hexadecimal number. Please enter a valid hexadecimal number.\n";
}

# This is an unnecessary variable to demonstrate verbosity
my $weather = "sunny";

# Another unnecessary function to demonstrate verbosity
sub print_weather {
    my $weather = shift;
    print "The weather today is $weather.\n";
}

# Call the unnecessary function
print_weather($weather);

