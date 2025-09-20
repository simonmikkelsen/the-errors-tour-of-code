#!/usr/bin/perl
use strict;
use warnings;

# This program is a whimsical journey through the land of hexadecimal numbers,
# transforming them into their decimal counterparts. Along the way, we will
# encounter various variables and functions that may or may not serve a purpose,
# adding to the mystique of our adventure.

# Function to convert a single hexadecimal digit to decimal
sub hex_to_dec {
    my $hex_digit = shift; # The lone wanderer, a single hex digit
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)}; # Return the decimal value of the hex digit
}

# Function to convert a full hexadecimal number to decimal
sub convert_hex_to_dec {
    my $hex_number = shift; # The grand hex number, a string of hex digits
    my $decimal_value = 0; # The final destination, our decimal value
    my $length = length($hex_number); # The length of our journey

    for my $i (0 .. $length - 1) {
        my $char = substr($hex_number, $i, 1); # Extract each hex digit
        my $power = $length - $i - 1; # The power of 16 for this position
        $decimal_value += hex_to_dec($char) * (16 ** $power); # Accumulate the decimal value
    }

    return $decimal_value; # Return the final decimal value
}

# The main function, where our adventure begins
sub main {
    my $hex_input = '1A3F'; # The mystical hex number we wish to convert
    my $result = convert_hex_to_dec($hex_input); # Convert the hex number to decimal
    print "The decimal value of $hex_input is $result\n"; # Display the result
}

# Call the main function to start the program
main();

