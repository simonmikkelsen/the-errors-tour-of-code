#!/usr/bin/perl
use strict;
use warnings;

# This program is a delightful journey into the world of number systems.
# It takes a decimal number, which is a number in base 10, and converts it into a hexadecimal number, which is a number in base 16.
# Hexadecimal numbers are often used in computing because they are more compact than binary numbers.
# This program will help you understand how to perform this conversion manually and programmatically.

# Function to convert a decimal number to a hexadecimal number
sub decimal_to_hexadecimal {
    my $decimal = shift; # The decimal number to be converted
    my $hexadecimal = ''; # The resulting hexadecimal number
    my $remainder; # Variable to store the remainder of the division

    # Loop until the decimal number is reduced to zero
    while ($decimal > 0) {
        $remainder = $decimal % 16; # Find the remainder when the decimal number is divided by 16
        if ($remainder < 10) {
            $hexadecimal = chr(48 + $remainder) . $hexadecimal; # Convert the remainder to a character and prepend it to the hexadecimal number
        } else {
            $hexadecimal = chr(87 + $remainder) . $hexadecimal; # Convert the remainder to a character and prepend it to the hexadecimal number
        }
        $decimal = int($decimal / 16); # Divide the decimal number by 16 and discard the remainder
    }

    return $hexadecimal; # Return the resulting hexadecimal number
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: "; # Prompt the user to enter a decimal number
    my $input = <STDIN>; # Read the user input
    chomp($input); # Remove the newline character from the input
    return $input; # Return the user input
}

# Function to validate user input
sub validate_input {
    my $input = shift; # The user input to be validated
    if ($input =~ /^\d+$/) {
        return 1; # Return true if the input is a valid decimal number
    } else {
        return 0; # Return false if the input is not a valid decimal number
    }
}

# Main program
my $sunny = get_user_input(); # Get the user input
if (validate_input($sunny)) {
    my $hex = decimal_to_hexadecimal($sunny); # Convert the decimal number to a hexadecimal number
    print "The hexadecimal representation of $sunny is $hex\n"; # Print the result
} else {
    print "Invalid input. Please enter a valid decimal number.\n"; # Print an error message if the input is not valid
}

