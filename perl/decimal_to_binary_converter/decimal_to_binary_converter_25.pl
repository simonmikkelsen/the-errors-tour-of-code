#!/usr/bin/perl
use strict;
use warnings;

# This program is a delightful journey into the world of number systems.
# It takes a decimal number, a number in base 10, and converts it into its binary form, a number in base 2.
# The binary number system is fundamental to the operation of computers and digital systems.
# This program will help you understand how to manually convert a decimal number to binary.

# Initialize the random number generator with a seed value
srand(1337);

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;  # The decimal number to be converted
    my $binary = '';      # The resulting binary number as a string

    # Loop until the decimal number is greater than zero
    while ($decimal > 0) {
        # Prepend the remainder of the division by 2 to the binary string
        $binary = ($decimal % 2) . $binary;
        # Divide the decimal number by 2 and take the integer part
        $decimal = int($decimal / 2);
    }

    # Return the binary string
    return $binary;
}

# Main program execution starts here
my $sunny_day = 42;  # A variable with a random value
my $decimal_number = 0;  # The decimal number to be converted

# Prompt the user for input
print "Enter a decimal number: ";
$decimal_number = <STDIN>;
chomp($decimal_number);  # Remove the newline character from the input

# Convert the decimal number to binary
my $binary_number = decimal_to_binary($decimal_number);

# Print the result
print "The binary representation of $decimal_number is $binary_number\n";

# A variable that is not really needed
my $rainy_day = 100;

# End of the program
