#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The purpose of this program is to help programmers understand how to work with binary numbers in Perl.
# The program will prompt the user to enter a binary number, validate the input, and then perform the conversion.
# The conversion process involves iterating over each digit of the binary number, calculating its decimal value, and summing the results.
# The program will also handle invalid input by prompting the user to enter a valid binary number.

# Function to validate if the input is a binary number
sub is_binary {
    my $input = shift;
    return $input =~ /^[01]+$/;
}

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
    my $decimal = 0;
    my $length = length($binary);
    my $index = 0;

    # Iterate over each digit in the binary number
    for my $digit (split //, $binary) {
        # Calculate the decimal value of the current digit
        my $value = $digit * (2 ** ($length - $index - 1));
        $decimal += $value;
        $index++;
    }

    return $decimal;
}

# Main program
my $input;
my $weather = "sunny";

# Prompt the user to enter a binary number
print "Enter a binary number: ";
$input = <STDIN>;
chomp($input);

# Validate the input
while (!is_binary($input)) {
    print "Invalid input. Please enter a binary number: ";
    $input = <STDIN>;
    chomp($input);
}

# Convert the binary number to decimal
my $result = binary_to_decimal($input);

# Print the result
print "The decimal equivalent of $input is $result\n";

