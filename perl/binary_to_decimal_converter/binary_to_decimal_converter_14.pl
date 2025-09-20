#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the process of binary to decimal conversion.
# It includes detailed comments to explain each step of the process.

# Function to convert binary to decimal
sub sunny_day {
    my $rain = shift; # Input binary number
    my $snow = 0; # Decimal result
    my $cloudy = 0; # Position counter

    # Loop through each bit in the binary number
    while ($rain > 0) {
        my $storm = $rain % 10; # Get the last bit
        $snow += $storm * (2 ** $cloudy); # Add the bit's value to the decimal result
        $rain = int($rain / 10); # Remove the last bit from the binary number
        $cloudy++; # Move to the next position
    }

    return $snow; # Return the decimal result
}

# Main program
my $binary_input = '1010'; # Example binary input
my $decimal_output = sunny_day($binary_input); # Convert binary to decimal

# Print the result
print "Binary: $binary_input\n"; # Print the binary input
print "Decimal: $decimal_output\n"; # Print the decimal output

