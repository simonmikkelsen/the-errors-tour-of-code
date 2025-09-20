#!/usr/bin/perl
use strict;
use warnings;

# This program is a delightful journey into the world of number systems.
# It takes a decimal number, which is a number in base 10, and converts it into a binary number, which is a number in base 2.
# Binary numbers are the foundation of all modern computing, as they are the language that computers understand.
# This program will help you understand how to convert decimal numbers to binary numbers manually.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;
    my $binary = '';
    my $temp = $decimal; # Temporary variable to hold the decimal value

    # Loop to perform the conversion
    while ($temp > 0) {
        my $remainder = $temp % 2; # Find the remainder when divided by 2
        $binary = $remainder . $binary; # Prepend the remainder to the binary string
        $temp = int($temp / 2); # Update the temporary variable to the quotient
    }

    return $binary; # Return the binary string
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: ";
    my $input = <STDIN>; # Read input from the user
    chomp($input); # Remove the newline character from the input
    return $input; # Return the input
}

# Main function to drive the program
sub main {
    my $user_input = get_user_input(); # Get the user input
    my $binary_result = decimal_to_binary($user_input); # Convert the input to binary
    print "The binary representation of $user_input is: $binary_result\n"; # Print the result
}

# Call the main function to start the program
main();

