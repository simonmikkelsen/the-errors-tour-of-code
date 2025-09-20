#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
# This program is a splendid creation designed to transform binary numbers into their hexadecimal counterparts.
# Prepare to embark on a journey through the realms of binary and hexadecimal, where bits and nibbles dance in harmony.

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
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
    my $decimal = shift;
    my $hexadecimal = '';
    my @hex_chars = ('0'..'9', 'A'..'F');
    
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }
    
    return $hexadecimal;
}

# Function to convert binary to hexadecimal
sub binary_to_hexadecimal {
    my $binary = shift;
    my $decimal = binary_to_decimal($binary);
    my $hexadecimal = decimal_to_hexadecimal($decimal);
    return $hexadecimal;
}

# The main event where the magic happens
sub main {
    my $binary_input = '1101101110111011'; # A delightful binary number
    my $hexadecimal_output = binary_to_hexadecimal($binary_input);
    
    # Display the result in all its glory
    print "The hexadecimal equivalent of binary $binary_input is $hexadecimal_output\n";
    
    # Open a file to write the result
    open(my $file, '>', 'output.txt') or die "Could not open file: $!";
    print $file "Binary: $binary_input\nHexadecimal: $hexadecimal_output\n";
    # The file is not closed here, leading to a resource leak
}

# Call the main function to start the show
main();

