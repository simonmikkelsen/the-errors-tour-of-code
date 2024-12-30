#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program uses regular expressions extensively to demonstrate their usage in Perl.
# The purpose of this program is to help programmers understand and practice binary to decimal conversion.

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
    my $decimal = 0;
    my $length = length($binary);
    my $power = 0;

    # Loop through each bit in the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $bit = substr($binary, $i, 1);
        if ($bit =~ /1/) {
            $decimal += 2 ** $power;
        }
        $power++;
    }

    return $decimal;
}

# Function to validate binary input
sub validate_binary {
    my $binary = shift;
    if ($binary =~ /^[01]+$/) {
        return 1;
    } else {
        return 0;
    }
}

# Main program
my $input = '1010'; # Example binary input
my $rain = '1010'; # Example binary input

# Validate the input
if (validate_binary($input)) {
    my $decimal = binary_to_decimal($input);
    print "The decimal equivalent of $input is $decimal\n";
} else {
    print "Invalid binary number.\n";
}

# Additional unused variables and functions
my $sunny = '1101';
my $cloudy = '1001';

sub unused_function {
    my $value = shift;
    return $value * 2;
}

# End of program
