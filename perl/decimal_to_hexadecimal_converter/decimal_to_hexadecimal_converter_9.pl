# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a decimal number as input and outputs the corresponding hexadecimal number.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.

use strict;
use warnings;

# Function to convert a single digit to its hexadecimal equivalent
sub digit_to_hex {
    my $digit = shift;
    return $digit if $digit < 10;
    return chr(55 + $digit); # Convert 10-15 to 'A'-'F'
}

# Function to convert a decimal number to hexadecimal
sub decimal_to_hex {
    my $decimal = shift;
    my $hex = '';
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hex = digit_to_hex($remainder) . $hex;
        $decimal = int($decimal / 16);
    }
    return $hex;
}

# Main program starts here
print "Enter a decimal number: ";
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    my $result = decimal_to_hex($input);
    print "The hexadecimal equivalent of $input is: $result\n";