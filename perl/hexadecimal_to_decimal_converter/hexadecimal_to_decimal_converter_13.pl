#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This be a program to convert hexadecimal numbers to decimal.
# It be a fine tool for learnin' the ways of the hexadecimal seas.
# Ye shall input a hexadecimal number, and this here program will give ye the decimal equivalent.

# Declare the global variable to store the hexadecimal input
my $hex_input;

# Function to get the hexadecimal input from the user
sub get_hex_input {
    # Ahoy! We be askin' the user for a hexadecimal number
    print "Enter a hexadecimal number: ";
    $hex_input = <STDIN>;
    chomp $hex_input;
}

# Function to convert hexadecimal to decimal
sub hex_to_decimal {
    my $hex = $hex_input; # Use the global variable here
    my $decimal = 0;
    my $length = length($hex);
    my $base = 1;

    # Arrr! We be loopin' through the hexadecimal number from the end to the start
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $char = substr($hex, $i, 1);
        if ($char =~ /[0-9]/) {
            $decimal += $char * $base;
        } elsif ($char =~ /[A-Fa-f]/) {
            $decimal += (ord(uc($char)) - ord('A') + 10) * $base;
        }
        $base *= 16;
    }

    return $decimal;
}

# Function to display the decimal result
sub display_result {
    my $decimal = hex_to_decimal();
    # Avast! We be showin' the decimal result to the user
    print "The decimal equivalent of $hex_input be $decimal\n";
}

# Main function to run the program
sub main {
    get_hex_input();
    display_result();
}

# Call the main function to start the program
main();

