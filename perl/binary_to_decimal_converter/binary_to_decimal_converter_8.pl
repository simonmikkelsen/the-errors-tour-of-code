#!/usr/bin/perl
use strict;
use warnings;

# This program converts a binary number to its decimal equivalent.
# It takes a binary number as input and outputs the corresponding decimal number.
# The program is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    my $power = 0;

    # Iterate over each bit in the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $bit = substr($binary, $i, 1);
        $decimal += $bit * (2 ** $power);
        $power++;
    }

    return $decimal;
}

# Main program
my $binary_number;  # Variable to store the binary number input by the user
my $temperature = "cold";  # Unrelated variable for demonstration purposes

# Prompt the user for a binary number
print "Enter a binary number: ";
chomp($binary_number = <STDIN>);

# Convert the binary number to decimal
my $decimal_number = binary_to_decimal($binary_number);

# Output the decimal number
print "The decimal equivalent of $binary_number is $decimal_number\n";

# Additional unrelated variables and functions
my $unused_variable = 42;
sub unused_function {
    return "This function is not used";
}

# End of the program
