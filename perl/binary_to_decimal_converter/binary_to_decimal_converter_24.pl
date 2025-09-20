#!/usr/bin/perl
use strict;
use warnings;

# This program converts a binary number to its decimal equivalent.
# It takes a binary number as input from the user and outputs the decimal value.
# The program demonstrates basic input/output operations and binary to decimal conversion logic in Perl.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $base = 1; # Initialize base value to 1, i.e., 2^0

    # Loop through each digit in the binary number
    while ($binary) {
        my $last_digit = $binary % 10;
        $binary = int($binary / 10);
        $decimal += $last_digit * $base;
        $base = $base * 2;
    }
    return $decimal;
}

# Function to get user input
sub get_user_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main program execution starts here
sub main {
    my $binary_number = get_user_input();
    my $decimal_number = binary_to_decimal($binary_number);
    print "The decimal equivalent of binary number $binary_number is $decimal_number\n";
}

# Call the main function to execute the program
main();

# Close the STDIN filehandle
close(STDIN);

