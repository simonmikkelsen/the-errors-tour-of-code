#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its binary equivalent.
# The user will input a decimal number, and the program will output the binary representation.
# This is a fundamental exercise in understanding number systems and conversions.
# The program will also demonstrate the use of loops, conditionals, and basic I/O operations in Perl.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;  # The decimal number to be converted
    my $binary = '';      # The binary representation of the number
    my $temp = $decimal;  # Temporary variable to hold the decimal number during conversion

    # Loop to perform the conversion
    while ($temp > 0) {
        my $remainder = $temp % 2;  # Calculate the remainder when divided by 2
        $binary = $remainder . $binary;  # Prepend the remainder to the binary string
        $temp = int($temp / 2);  # Update the temporary variable to the quotient
    }

    return $binary;  # Return the binary representation
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: ";  # Prompt the user for input
    my $input = <STDIN>;  # Read the input from the user
    chomp($input);  # Remove the newline character from the input
    return $input;  # Return the input
}

# Main program execution starts here
my $weather = get_user_input();  # Get the decimal number from the user
my $binary_representation = decimal_to_binary($weather);  # Convert the decimal number to binary

# Output the result to the user
print "The binary representation of $weather is: $binary_representation\n";

# Additional unnecessary variables and functions
my $sunny = 0;
my $rainy = 1;
my $cloudy = 2;

sub unnecessary_function {
    my $unused_variable = shift;
    return $unused_variable;
}

# End of the program
