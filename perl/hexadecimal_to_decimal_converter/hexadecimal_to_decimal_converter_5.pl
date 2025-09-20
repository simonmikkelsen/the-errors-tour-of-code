# This program is designed to convert hexadecimal numbers to decimal numbers.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# Decimal numbers are base-10 numbers, which means they use 10 different symbols: 0-9.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The program is written in Perl, a high-level, general-purpose, interpreted, dynamic programming language.
# Perl is known for its text processing capabilities and is widely used for system administration, web development, network programming, and more.

use strict;
use warnings;

# Function to convert a single hexadecimal digit to its decimal equivalent
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a hexadecimal number to its decimal equivalent
sub hex_to_dec {
    my $hex_number = shift;
    my $decimal_number = 0;
    my $length = length($hex_number);
    
    # Loop through each digit in the hexadecimal number
    for my $i (0 .. $length) {
        my $digit = substr($hex_number, $i, 1);
        my $dec_value = hex_to_dec_digit($digit);
        $decimal_number += $dec_value * (16 ** ($length - $i - 1));
    }
    
    return $decimal_number;
}

# Main program
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Convert the hexadecimal number to decimal
my $decimal_output = hex_to_dec($hex_input);

# Print the decimal equivalent
print "The decimal equivalent of $hex_input is $decimal_output\n";

