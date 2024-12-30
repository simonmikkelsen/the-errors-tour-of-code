#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to convert a single hexadecimal digit to its decimal value
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a full hexadecimal number to its decimal value
sub hex_to_dec {
    my $hex_number = shift;
    my $decimal_value = 0;
    my $length = length($hex_number);
    my $power = 0;

    # Loop through each digit in the hexadecimal number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $digit = substr($hex_number, $i, 1);
        $decimal_value += hex_to_dec_digit($digit) * (16 ** $power);
        $power++;
    }

    return $decimal_value;
}

# Main program execution starts here
# Prompt the user for a hexadecimal number
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Open a file to log the conversion process
open(my $log_file, '>', 'conversion_log.txt') or die "Could not open file: $!";

# Log the input hexadecimal number
print $log_file "Hexadecimal Input: $hex_input\n";

# Convert the hexadecimal number to decimal
my $decimal_output = hex_to_dec($hex_input);

# Log the output decimal number
print $log_file "Decimal Output: $decimal_output\n";

# Close the log file
close($log_file);

# Print the result to the user
print "The decimal equivalent of $hex_input is $decimal_output\n";

# Reopen the log file