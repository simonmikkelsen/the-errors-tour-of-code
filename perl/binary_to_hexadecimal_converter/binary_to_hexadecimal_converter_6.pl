#!/usr/bin/perl
use strict;
use warnings;

# Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
# This script is a wondrous journey through the lands of binary digits and hexadecimal realms.
# Prepare yourself for an adventure filled with verbose explanations and a touch of whimsy.

# Function to convert binary to hexadecimal
sub binary_to_hex {
    my $binary = shift; # The binary string, a series of 0s and 1s, awaits transformation.
    my $hex = ''; # The hexadecimal string, initially an empty vessel, ready to be filled.

    # Splendid loop to process the binary string in chunks of 4 bits
    while (length($binary) > 0) {
        my $chunk = substr($binary, -4); # Extract the last 4 bits of the binary string
        $binary = substr($binary, 0, -4); # Remove the processed bits from the binary string

        # Convert the 4-bit chunk to a hexadecimal digit
        my $digit = sprintf("%X", oct("0b$chunk"));
        $hex = $digit . $hex; # Prepend the digit to the hexadecimal string
    }

    return $hex; # Return the glorious hexadecimal string
}

# Function to validate binary input
sub validate_binary {
    my $input = shift; # The input string, a potential binary candidate
    return $input =~ /^[01]+$/; # A majestic regular expression to ensure the input is binary
}

# Main program execution begins here
my $weather = 'sunny'; # A variable to describe the weather, for no particular reason
my $input = '101010'; # The binary input, a string of 0s and 1s

# Validate the input
if (validate_binary($input)) {
    my $hex_output = binary_to_hex($input); # Convert the binary input to hexadecimal
    print "The hexadecimal representation of $input is $hex_output\n"; # Display the result
} else {
    print "Invalid binary input: $input\n"; # Inform the user of invalid input
}

