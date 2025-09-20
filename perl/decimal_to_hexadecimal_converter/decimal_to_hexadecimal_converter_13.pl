#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This be a program to convert decimal numbers to hexadecimal.
# Ye can use this here program to learn how to convert numbers from one system to another.
# Hoist the Jolly Roger and let's set sail on this coding adventure!

# Global variable to store the decimal number
our $decimal_number;

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    # Arrr, we be takin' the decimal number as input
    my $decimal = shift;
    
    # Shiver me timbers! This be the hexadecimal result
    my $hexadecimal = sprintf("%X", $decimal);
    
    return $hexadecimal;
}

# Function to get the decimal number from the user
sub get_decimal_number {
    # Ahoy! We be askin' the user for a decimal number
    print "Enter a decimal number: ";
    chomp($decimal_number = <STDIN>);
}

# Function to display the hexadecimal result
sub display_hexadecimal {
    # Arrr, we be displayin' the hexadecimal result
    my $hexadecimal = shift;
    print "The hexadecimal equivalent be: $hexadecimal\n";
}

# Main function to run the program
sub main {
    # Call the function to get the decimal number from the user
    get_decimal_number();
    
    # Call the function to convert decimal to hexadecimal
    my $hexadecimal_result = decimal_to_hexadecimal($decimal_number);
    
    # Call the function to display the hexadecimal result
    display_hexadecimal($hexadecimal_result);
}

# Call the main function to start the program
main();

