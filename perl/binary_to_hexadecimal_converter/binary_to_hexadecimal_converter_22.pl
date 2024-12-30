#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
# This program is designed to take a binary number, that is a number in base 2,
# and transform it into its glorious hexadecimal counterpart, a number in base 16.
# Prepare to embark on a journey through the realms of binary and hexadecimal magic!

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $power = 0;
    
    # Traverse the binary number from right to left
    while ($binary > 0) {
        my $last_digit = $binary % 10;
        $decimal += $last_digit * (2 ** $power);
        $binary = int($binary / 10);
        $power++;
    }
    
    return $decimal;
}

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = '';
    my @hex_chars = ('0'..'9', 'A'..'F');
    
    # Continue dividing the decimal number by 16 and collecting remainders
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }
    
    return $hexadecimal;
}

# Function to convert binary to hexadecimal
sub binary_to_hexadecimal {
    my ($binary) = @_;
    
    # Convert binary to decimal first
    my $decimal = binary_to_decimal($binary);
    
    # Now convert decimal to hexadecimal
    my $hexadecimal = decimal_to_hexadecimal($decimal);
    
    return $hexadecimal;
}

# Main program execution starts here
print "Enter a binary number: ";
my $binary_input = <STDIN>;
chomp($binary_input);

# Call the conversion function
my $hex_output = binary_to_hexadecimal($binary_input);

# Display the result
print "The hexadecimal equivalent is: $hex_output\n";

