#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
# This program will take you on a journey through the realms of binary numbers,
# transforming them into their glorious hexadecimal counterparts.
# Prepare yourself for an adventure filled with variables, functions, and verbose commentary!

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
    my $decimal = 0;
    my $power = 0;

    # Traverse the binary number from right to left
    while ($binary > 0) {
        my $digit = $binary % 10;
        $decimal += $digit * (2 ** $power);
        $binary = int($binary / 10);
        $power++;
    }

    return $decimal;
}

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my $decimal = shift;
    my $hexadecimal = '';
    my @hex_chars = ('0'..'9', 'A'..'F');

    # Continue until the decimal number is reduced to zero
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

# Main program execution starts here
print "Enter a binary number: ";
my $binary_input = <STDIN>;
chomp($binary_input);

# Validate the binary input
if ($binary_input !~ /^[01]+$/) {
    die "Invalid binary number. Please enter a number containing only 0s and 1s.\n";
}

# Convert binary to hexadecimal
my $hexadecimal_output = binary_to_hexadecimal($binary_input);

# Display the result
print "The hexadecimal equivalent of $binary_input is $hexadecimal_output\n";

