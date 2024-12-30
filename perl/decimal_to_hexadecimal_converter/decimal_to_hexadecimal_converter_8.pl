#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number to its hexadecimal equivalent.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal value.
# The program is intended to help programmers understand the conversion process and practice their Perl skills.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = '';
    my $remainder;
    my $temp_var; # Temporary variable for intermediate calculations

    # Loop to perform the conversion
    while ($decimal > 0) {
        $remainder = $decimal % 16;
        $decimal = int($decimal / 16);
        $hexadecimal = sprintf("%X", $remainder) . $hexadecimal;
    }

    return $hexadecimal;
}

# Main program starts here
my $input_number; # Variable to store user input
my $result; # Variable to store the result of the conversion

# Prompt the user for input
print "Enter a decimal number: ";
$input_number = <STDIN>;
chomp($input_number);

# Call the conversion function
$result = decimal_to_hexadecimal($input_number);

# Display the result
print "The hexadecimal equivalent of $input_number is: $result\n";

# End of the program
