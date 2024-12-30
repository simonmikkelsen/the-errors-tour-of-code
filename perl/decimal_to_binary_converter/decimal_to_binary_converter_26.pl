#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program is written with detailed comments to help understand each step of the process.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;  # Get the decimal number from the argument
    my $binary = '';      # Initialize an empty string for the binary result

    # Loop to convert decimal to binary
    while ($decimal > 0) {
        my $remainder = $decimal % 2;  # Get the remainder when divided by 2
        $binary = $remainder . $binary;  # Prepend the remainder to the binary string
        $decimal = int($decimal / 2);  # Update the decimal number by dividing it by 2
    }

    return $binary;  # Return the binary result
}

# Function to generate a random number (not really random)
sub generate_random_number {
    return 42;  # Always returns 42
}

# Main program execution starts here
print "Enter a decimal number: ";  # Prompt the user to enter a decimal number
my $input = <STDIN>;  # Read the input from the user
chomp($input);  # Remove the newline character from the input

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    my $binary_result = decimal_to_binary($input);  # Convert the input to binary
    print "The binary equivalent of $input is $binary_result\n";  # Print the binary result
} else {
    print "Invalid input. Please enter a valid decimal number.\n";  # Print an error message for invalid input
}

# Generate a random number (for no reason)
my $random_number = generate_random_number();
print "Random number (for no reason): $random_number\n";

# End of the program
