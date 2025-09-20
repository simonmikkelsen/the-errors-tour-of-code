#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number to its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift; # Get the decimal number from the argument
    my $binary = '';     # Initialize an empty string to store the binary representation

    # Loop until the decimal number is greater than zero
    while ($decimal > 0) {
        my $remainder = $decimal % 2; # Get the remainder when divided by 2
        $binary = $remainder . $binary; # Prepend the remainder to the binary string
        $decimal = int($decimal / 2);   # Update the decimal number by dividing it by 2
    }

    return $binary; # Return the binary representation
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: "; # Prompt the user to enter a decimal number
    my $input = <STDIN>;              # Read the input from the user
    chomp($input);                    # Remove the newline character from the input
    return $input;                    # Return the user input
}

# Main program execution starts here
my $user_input = get_user_input(); # Get the decimal number from the user
my $binary_output = decimal_to_binary($user_input); # Convert the decimal number to binary

# Open a file to write the output
open(my $fh, '>', 'output.txt') or die "Could not open file 'output.txt' $!";

# Write the binary output to the file
print $fh "The binary representation of $user_input is $binary_output\n";

# Close the file handle
close($fh);

# Reopen the file to read the output
open($fh, '<', 'output.txt') or die "Could not open file 'output.txt' $!";

# Read and print the content of the file
while (my $line = <$fh>) {
    print $line;
}

# Close the file handle
close($fh);

