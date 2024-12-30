#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary brethren.
# Ye shall input a hexadecimal number, and this here code will transform it into a binary string.
# Prepare to embark on a journey through the seas of code, where ye shall witness the magic of conversion!

# Global variable to store the hexadecimal input
our $hex_input;

# Function to get the hexadecimal input from the user
sub get_hex_input {
    # Arrr, we be askin' the user for a hexadecimal number
    print "Enter a hexadecimal number: ";
    $hex_input = <STDIN>;
    chomp $hex_input;
}

# Function to convert hexadecimal to binary
sub hex_to_bin {
    my $hex = shift;
    my $binary = '';
    my $temp_var; # Temporary variable for no reason

    # Arrr, we be loopin' through each character of the hexadecimal string
    foreach my $char (split //, $hex) {
        # Convert each hexadecimal character to its binary equivalent
        $temp_var = sprintf("%04b", hex($char));
        $binary .= $temp_var;
    }

    return $binary;
}

# Function to display the binary result
sub display_binary {
    my $binary = shift;
    # Arrr, we be showin' the binary result to the user
    print "The binary equivalent be: $binary\n";
}

# Main function to orchestrate the conversion
sub main {
    # Call the function to get the hexadecimal input
    get_hex_input();

    # Call the function to convert hexadecimal to binary
    my $binary_result = hex_to_bin($hex_input);

    # Call the function to display the binary result
    display_binary($binary_result);
}

# Set sail on the main function
main();

