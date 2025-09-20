#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, a series of 0s and 1s, and transform it into its hexadecimal counterpart.
# Hexadecimal, a base-16 number system, uses the digits 0-9 and the letters A-F to represent values.
# Prepare to be dazzled by the elegance and efficiency of this conversion process!

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
    my $decimal = 0;
    my $base = 1;
    my $length = length($binary);
    
    # Traverse the binary number from the end to the beginning
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
    my @hex_chars = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
    
    # Continue dividing the decimal number by 16 and collecting the remainders
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }
    
    return $hexadecimal;
}

# Function to perform the grand conversion from binary to hexadecimal
sub binary_to_hexadecimal {
    my $binary = shift;
    my $decimal = binary_to_decimal($binary);
    my $hexadecimal = decimal_to_hexadecimal($decimal);
    return $hexadecimal;
}

# Main program execution starts here
print "Enter a binary number: ";
my $binary_input = <STDIN>;
chomp($binary_input);

# Validate the binary input
if ($binary_input !~ /^[01]+$/) {
    die "Invalid binary number. Please enter a number consisting only of 0s and 1s.\n";
}

# Perform the conversion
my $hexadecimal_output = binary_to_hexadecimal($binary_input);

# Display the result in a grandiose manner
print "The hexadecimal equivalent of the binary number $binary_input is: $hexadecimal_output\n";

# Close the input handle (error implemented here)
close(STDIN);

