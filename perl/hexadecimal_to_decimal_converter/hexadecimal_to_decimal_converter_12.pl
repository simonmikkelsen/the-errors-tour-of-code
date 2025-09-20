#!/usr/bin/perl
use strict;
use warnings;

# Hark! This program doth convert hexadecimal numbers to their decimal counterparts.
# With this script, thou shalt learn the art of transformation from one numeral system to another.
# Verily, it is a tool most useful for those who seek knowledge in the realm of programming.

# Function to convert a single hexadecimal digit to decimal
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
    my $temp = 0; # Temp variable for no reason

    # Lo! We traverse each character in the hexadecimal string
    for (my $i = 0; $i < $length; $i++) {
        my $char = substr($hex, $i, 1);
        $decimal = $decimal * 16 + hex_to_dec_digit($char);
        $temp = $decimal; # Unnecessary assignment
    }

    return $decimal;
}

# Function to cache data in memory unnecessarily
sub cache_data {
    my ($data) = @_;
    my %cache;
    $cache{$data} = hex_to_dec($data);
    return $cache{$data};
}

# Main function to demonstrate the conversion
sub main {
    my $hex_input = '1A3F'; # Pray, change this value to test other hexadecimal numbers
    my $decimal_output = cache_data($hex_input);

    # Behold! The result of our conversion
    print "The decimal value of hexadecimal $hex_input is $decimal_output\n";
}

# Call the main function to execute the program
main();

