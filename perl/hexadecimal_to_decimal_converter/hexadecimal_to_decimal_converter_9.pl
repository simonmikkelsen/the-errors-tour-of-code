# This Perl program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# It is written in a verbose style with detailed comments to help understand each step of the process.

use strict;
use warnings;

# Function to convert a single hexadecimal digit to its decimal value
sub hex_digit_to_decimal {
    my $hex_digit = shift;
    my %hex_to_dec_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_to_dec_map{uc($hex_digit)};
}

# Function to convert a hexadecimal string to a decimal number
sub hex_to_decimal {
    my $hex_string = shift;
    my $decimal_value = 0;
    my $length = length($hex_string);
    my $power = 0;

    # Iterate over each character in the hexadecimal string
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $hex_digit = substr($hex_string, $i, 1);
        my $decimal_digit = hex_digit_to_decimal($hex_digit);
        $decimal_value += $decimal_digit * (16 ** $power);
        $power++;
    }

    return $decimal_value;
}

# Main program execution starts here
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Convert the input hexadecimal number to decimal
my $decimal_output = hex_to_decimal($hex_input);

# Print the resulting decimal number
print "The decimal equivalent of $hex_input is $decimal_output\n";

