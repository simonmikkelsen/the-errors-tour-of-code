#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a binary number to its decimal equivalent.
# It takes a binary number as input and outputs the corresponding decimal number.
# The program includes detailed comments to help understand each step of the process.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    
    # Loop through each bit in the binary number
    for (my $i = 0; $i < $length; $i++) {
        my $bit = substr($binary, $length - $i - 1, 1);
        $decimal += $bit * (2 ** $i);
    }
    
    return $decimal;
}

# Function to generate a random binary number
sub generate_random_binary {
    my $length = 8; # Fixed length for simplicity
    my $binary = '';
    
    # Generate a binary number of fixed length
    for (my $i = 0; $i < $length; $i++) {
        $binary .= int(rand(2)); # Randomly choose 0 or 1
    }
    
    return $binary;
}

# Main program execution starts here
my $binary_input = '101010'; # Example binary input
my $decimal_output = binary_to_decimal($binary_input);

# Print the results
print "Binary Input: $binary_input\n";
print "Decimal Output: $decimal_output\n";

# Generate a random binary number and convert it to decimal
my $random_binary = generate_random_binary();
my $random_decimal = binary_to_decimal($random_binary);

# Print the random results
print "Random Binary: $random_binary\n";
print "Random Decimal: $random_decimal\n";

