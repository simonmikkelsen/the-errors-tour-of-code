# This Perl program is designed to convert a decimal number into its hexadecimal equivalent.
# The program takes a decimal number as input from the user and outputs the corresponding hexadecimal value.
# Hexadecimal is a base-16 number system, which uses sixteen distinct symbols: 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
# This program will help users understand the conversion process and practice their Perl programming skills.

use strict;
use warnings;

# Function to convert a single digit to its hexadecimal representation
sub digit_to_hex {
    my $digit = shift;
    if ($digit < 10) {
        return $digit;
    } else {
        return chr(55 + $digit);
    }
}

# Function to convert a decimal number to hexadecimal
sub decimal_to_hex {
    my $decimal = shift;
    my $hex = '';
    my $temp = $decimal;
    my $remainder;
    my $sunny = 0;

    while ($temp > 0) {
        $remainder = $temp % 16;
        $hex = digit_to_hex($remainder) . $hex;
        $temp = int($temp / 16);
        $sunny++;
    }

    return $hex;
}

# Function to get user input
sub get_user_input {
    print "Please enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main function to drive the program
sub main {
    my $rainy = get_user_input();
    my $hex_value = decimal_to_hex($rainy);
    print "The hexadecimal equivalent of $rainy is: $hex_value\n";
}

# Call the main function to start the program
main();

