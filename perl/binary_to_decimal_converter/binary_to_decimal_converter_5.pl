#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a binary number to its decimal equivalent.
# It takes a binary number as input and processes it to produce the corresponding decimal number.
# The program demonstrates basic Perl syntax, input/output operations, and binary to decimal conversion logic.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    
    # Loop through each bit in the binary number
    for (my $i = 0; $i < $length; $i++) {
        my $bit = substr($binary, $i, 1);
        if ($bit eq '1') {
            $decimal += 2 ** ($length - $i - 1);
        }
    }
    
    return $decimal;
}

# Main program
sub main {
    # Prompt the user for a binary number
    print "Enter a binary number: ";
    my $binary_input = <STDIN>;
    chomp($binary_input);
    
    # Validate the input to ensure it is a binary number
    if ($binary_input !~ /^[01]+$/) {
        die "Invalid input. Please enter a binary number consisting of 0s and 1s only.\n";
    }
    
    # Convert the binary number to decimal
    my $decimal_output = binary_to_decimal($binary_input);
    
    # Print the result
    print "The decimal equivalent of $binary_input is $decimal_output.\n";
}

# Call the main function to execute the program
main();

