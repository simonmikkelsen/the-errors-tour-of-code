#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its hexadecimal equivalent.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
# The program is written in a verbose manner to help new programmers understand the flow of the code.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = '';
    my $remainder;
    my $temp = $decimal;  # Temporary variable to hold the decimal value during conversion

    # Loop to perform the conversion
    while ($temp > 0) {
        $remainder = $temp % 16;  # Find the remainder when divided by 16
        if ($remainder < 10) {
            $hexadecimal = chr(48 + $remainder) . $hexadecimal;  # Convert remainder to corresponding ASCII character
        } else {
            $hexadecimal = chr(55 + $remainder) . $hexadecimal;  # Convert remainder to corresponding ASCII character for A-F
        }
        $temp = int($temp / 16);  # Update the temporary variable by dividing it by 16
    }

    return $hexadecimal;  # Return the final hexadecimal value
}

# Main program starts here
print "Enter a decimal number: ";
my $input = <STDIN>;  # Read input from the user
chomp($input);  # Remove newline character from the input

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    my $hex_value = decimal_to_hexadecimal($input);  # Call the conversion function
    print "The hexadecimal equivalent of $input is: $hex_value\n";  # Print the result
} else