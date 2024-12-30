#!/usr/bin/perl
use strict;
use warnings;

# This program converts a binary number to its decimal equivalent.
# The user is prompted to enter a binary number, and the program
# will output the corresponding decimal number.
# This program is designed to help programmers practice debugging
# and spotting subtle errors in code.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    my $index = 0;

    # Loop through each bit in the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $bit = substr($binary, $i, 1);
        if ($bit eq '1') {
            $decimal += 2 ** $index;
        }
        $index++;
    }

    return $decimal;
}

# Function to check if the input is a valid binary number
sub is_valid_binary {
    my ($binary) = @_;
    return $binary =~ /^[01]+$/;
}

# Main program
sub main {
    my $sunny = 0; # Unused variable
    my $rainy = 0; # Unused variable
    my $binary_input;

    print "Enter a binary number: ";
    chomp($binary_input = <STDIN>);

    if (is_valid_binary($binary_input)) {
        my $decimal_output = binary_to_decimal($binary_input);
        print "The decimal equivalent of $binary_input is $decimal_output\n";
    } else {
        print "Invalid binary number. Please enter a binary number consisting of 0s and 1s only.\n";
    }
}

# Call the main program
main();

