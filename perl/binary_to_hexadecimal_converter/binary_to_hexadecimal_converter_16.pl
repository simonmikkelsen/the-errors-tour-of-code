#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
# It is a splendid tool for those who wish to traverse the realms of numerical systems with ease and grace.
# Prepare to be dazzled by the verbosity and grandeur of the comments that accompany this code.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $power = 0;

    # Traverse the binary number from right to left
    while ($binary > 0) {
        my $last_digit = $binary % 10;
        $decimal += $last_digit * (2 ** $power);
        $binary = int($binary / 10);
        $power++;
    }

    return $decimal;
}

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = '';

    # Array of hexadecimal characters
    my @hex_chars = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

    # Convert decimal to hexadecimal
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }

    return $hexadecimal;
}

# Function to convert binary to hexadecimal
sub binary_to_hexadecimal {
    my ($binary) = @_;
    my $decimal = binary_to_decimal($binary);
    my $hexadecimal = decimal_to_hexadecimal($decimal);
    return $hexadecimal;
}

# Main program execution starts here
print "Enter a binary number: ";
my $binary_input = <STDIN>;
chomp($binary_input);

# Validate the binary input
if ($binary_input !~ /^[01]+$/) {
    die "Invalid binary number. Please enter a number consisting of only 0s and 1s.\n";
}

# Convert binary to hexadecimal
my $hexadecimal_output = binary_to_hexadecimal($binary_input);

# Display the result
print "The hexadecimal equivalent of binary $binary_input is: $hexadecimal_output\n";

