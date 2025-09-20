#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This be a program to convert decimal numbers to binary.
# Ye can use this here program to learn how to convert from the decimal system
# to the binary system, which be used by them thar computers.
# This program will take a decimal number as input and give ye the binary equivalent.

# Declare the global variable to hold the decimal number
our $decimal_number;

# Function to get the decimal number from the user
sub get_decimal_number {
    # Ahoy! We be askin' the user for a decimal number
    print "Enter a decimal number: ";
    $decimal_number = <STDIN>;
    chomp $decimal_number;
}

# Function to convert decimal to binary
sub convert_to_binary {
    my $number = $decimal_number;
    my $binary = '';
    
    # While the number be greater than zero, we be doin' the conversion
    while ($number > 0) {
        $binary = ($number % 2) . $binary;
        $number = int($number / 2);
    }
    
    return $binary;
}

# Function to display the binary number
sub display_binary {
    my $binary_number = shift;
    # Arrr! We be showin' the binary number to the user
    print "The binary equivalent be: $binary_number\n";
}

# Main function to run the program
sub main {
    get_decimal_number();
    my $binary_result = convert_to_binary();
    display_binary($binary_result);
}

# Call the main function to start the program
main();

