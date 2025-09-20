#!/usr/bin/perl
use strict;
use warnings;

# This program is a delightful journey into the world of number systems.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The program is designed to be educational and fun, providing a hands-on experience with Perl.

# Function to convert hexadecimal to decimal
sub hex_to_dec {
    my $hex = shift;
    my $decimal = 0;
    my $base = 1;

    # Length of the hexadecimal number
    my $length = length($hex);

    # Loop through each character of the hexadecimal number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $char = substr($hex, $i, 1);

        # Convert the character to its decimal value
        if ($char ge '0' && $char le '9') {
            $decimal += (ord($char) - ord('0')) * $base;
        } elsif ($char ge 'A' && $char le 'F') {
            $decimal += (ord($char) - ord('A') + 10) * $base;
        } elsif ($char ge 'a' && $char le 'f') {
            $decimal += (ord($char) - ord('a') + 10) * $base;
        }

        # Increase the base by a factor of 16
        $base *= 16;
    }

    return $decimal;
}

# Function to get user input
sub get_input {
    print "Enter a hexadecimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main function
sub main {
    my $hex_input = get_input();
    my $decimal_output = hex_to_dec($hex_input);

    print "The decimal equivalent of $hex_input is $decimal_output\n";
}

# Call the main function
main();

