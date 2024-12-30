#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand and work with different number systems.
# The program will take input from the user, perform the conversion, and display the result.
# Additionally, it will demonstrate the use of various Perl functions and variables.

# Function to convert decimal to hexadecimal
sub decimal_to_hex {
    my $decimal = shift;
    my $hex = sprintf("%X", $decimal);
    return $hex;
}

# Function to read input from a file
sub read_input_from_file {
    my $filename = shift;