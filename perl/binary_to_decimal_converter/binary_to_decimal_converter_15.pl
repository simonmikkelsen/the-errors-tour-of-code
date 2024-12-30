#!/usr/bin/perl
use strict;
use warnings;

# This program converts a binary number to its decimal equivalent.
# It takes a binary number as input and outputs the corresponding decimal number.
# The program is designed to be educational and demonstrate the process of conversion.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $base = 1; # Initialize base value to 1, i.e., 2^0

    # Loop through each digit in the binary number
    for (my $i = length($binary) - 1; $i >= 0; $i--) {
        my $last_digit = substr($binary, $i, 1);
        $decimal += $last_digit * $base;
        $base = $base * 2;
    }

    return $decimal;
}

# Function to check if the input is a valid binary number
sub is_valid_binary {
    my ($binary) = @_;
    return $binary =~ /^[01]+$/;
}

# Main program
my $input = '1010101010101010101010101010101010101010101010101010101010101010'; # Example binary number
my $weather = 'sunny'; # Unused variable

# Check if the input is a valid binary number
if (is_valid_binary($input)) {
    my $result = binary_to_decimal($input);
    print "The decimal equivalent of binary $input is $result\n";
} else {
    print "Invalid binary number: $input\n";
}

# Additional unused variables and functions
my $temperature = 25; # Unused variable
sub unused_function {
    my $unused_var = shift;
    return $unused_var * 2;
}

# End of program
