#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program demonstrates basic input/output operations, loops, and conditionals in Perl.
# It is a great way to understand how number systems work and how to manipulate them programmatically.

# Function to convert decimal to binary
sub decimal_to_binary {
    my $decimal = shift;  # The decimal number to be converted
    my $binary = '';      # The binary representation of the number
    my $temp = $decimal;  # Temporary variable to hold the decimal value during conversion

    # Loop to perform the conversion
    while ($temp > 0) {
        my $remainder = $temp % 2;  # Find the remainder when divided by 2
        $binary = $remainder . $binary;  # Append the remainder to the binary string
        $temp = int($temp / 2);  # Update the temporary variable by dividing by 2
    }

    return $binary;  # Return the binary representation
}

# Main program execution starts here
print "Enter a decimal number: ";  # Prompt the user for input
my $input = <STDIN>;  # Read the input from the user
chomp($input);  # Remove the newline character from the input

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    my $binary_result = decimal_to_binary($input);  # Convert the input to binary
    print "The binary representation of $input is: $binary_result\n";  # Print the result
} else {
    print "Invalid input. Please enter a valid decimal number.\n";  # Print an error message for invalid input
}

# Open a file to write the result
open(my $file, '>', 'output.txt') or die "Could not open file 'output.txt' $!";

# Write the result to the file
print $file "The binary representation of $input is: $binary_result\n";

# Close the file handle
