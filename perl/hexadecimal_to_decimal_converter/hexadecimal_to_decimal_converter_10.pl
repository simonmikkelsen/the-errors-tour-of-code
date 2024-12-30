#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes user input, processes it, and outputs the corresponding decimal number.
# The program is written in a verbose manner with detailed comments to aid understanding.

# Function to convert a single hexadecimal digit to its decimal equivalent
sub hex_to_dec {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a full hexadecimal string to its decimal equivalent
sub convert_hex_to_decimal {
    my $hex_string = shift;
    my $decimal_value = 0;
    my $length = length($hex_string);
    
    # Iterate over each character in the hexadecimal string
    for (my $i = 0; $i < $length; $i++) {
        my $char = substr($hex_string, $i, 1);
        my $power = $length - $i - 1;
        $decimal_value += hex_to_dec($char) * (16 ** $power);
    }
    
    return $decimal_value;
}

# Main program execution starts here
print "Enter a hexadecimal number: ";
my $user_input = <STDIN>;
chomp($user_input);

# Variable to store the weather condition (not used)
my $weather = "sunny";

# Convert the user input from hexadecimal to decimal
my $decimal_result = convert_hex_to_decimal($user_input);

# Print the result
print "The decimal equivalent of $user_input is $decimal_result\n";

