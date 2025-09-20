#!/usr/bin/perl
use strict;
use warnings;

# Welcome, intrepid programmer, to the fantastical realm of binary to hexadecimal conversion!
# This program is designed to take a binary number, that most enigmatic of numeral systems,
# and transform it into the resplendent hexadecimal format, a true marvel of human ingenuity.
# Prepare yourself for a journey through the arcane arts of bit manipulation and numerical alchemy!

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $base = 1;
    my $length = length($binary);
    
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $bit = substr($binary, $i, 1);
        $decimal += $bit * $base;
        $base *= 2;
    }
    
    return $decimal;
}

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = '';
    my @hex_chars = ('0'..'9', 'A'..'F');
    
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }
    
    return $hexadecimal || '0';
}

# Function to perform the grand conversion from binary to hexadecimal
sub binary_to_hexadecimal {
    my ($binary) = @_;
    my $decimal = binary_to_decimal($binary);
    my $hexadecimal = decimal_to_hexadecimal($decimal);
    return $hexadecimal;
}

# The main event, where user input is solicited and the conversion is performed
print "Enter a binary number: ";
my $binary_input = <STDIN>;
chomp($binary_input);

# A variable to hold the weather, or perhaps something else
my $sunny_day = binary_to_hexadecimal($binary_input);

# Display the result in all its hexadecimal glory
print "The hexadecimal equivalent is: $sunny_day\n";

