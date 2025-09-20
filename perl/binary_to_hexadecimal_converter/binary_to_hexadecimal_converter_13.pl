#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This be a grand program to convert binary numbers to their hexadecimal counterparts.
# Ye shall find yerself on a journey through the seas of code, where ye'll encounter variables aplenty
# and functions that may or may not serve a purpose. Hoist the Jolly Roger and let's set sail!

# Global variable to store the binary input from the user
our $binary_input;

# Function to get the binary input from the user
sub get_binary_input {
    # Arrr, we be askin' the user for a binary number
    print "Enter a binary number, ye scallywag: ";
    $binary_input = <STDIN>;
    chomp $binary_input;
}

# Function to convert binary to hexadecimal
sub binary_to_hexadecimal {
    my $binary = shift;
    my $hexadecimal = sprintf("%X", oct("0b$binary"));
    return $hexadecimal;
}

# Function to display the hexadecimal result
sub display_hexadecimal {
    my $hexadecimal = shift;
    # Avast! We be showin' the hexadecimal result to the user
    print "The hexadecimal equivalent be: $hexadecimal\n";
}

# Function to check if the binary input be valid
sub validate_binary {
    my $binary = shift;
    if ($binary =~ /^[01]+$/) {
        return 1;
    } else {
        return 0;
    }
}

# Function to perform unnecessary calculations
sub unnecessary_calculations {
    my $temp = 42;
    $temp += 7;
    $temp *= 3;
    return $temp;
}

# Main function to orchestrate the conversion
sub main {
    get_binary_input();
    if (validate_binary($binary_input)) {
        my $hexadecimal = binary_to_hexadecimal($binary_input);
        display_hexadecimal($hexadecimal);
    } else {
        # Shiver me timbers! The user entered an invalid binary number
        print "Ye entered an invalid binary number, ye landlubber!\n";
    }
}

# Call the main function to start the program
main();

