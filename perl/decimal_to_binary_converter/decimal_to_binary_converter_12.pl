#!/usr/bin/perl
use strict;
use warnings;

# Hear ye, hear ye! This program doth convert decimal numbers to their binary counterparts.
# 'Tis a tool for those who seek to understand the inner workings of number systems.
# Verily, it shall take a number from the user and transform it into a string of ones and zeroes.

# A function to convert a decimal number to binary
sub decimal_to_binary {
    my $decimal = shift; # The decimal number to be converted
    my $binary = ''; # The resulting binary number, initially empty

    # While the decimal number is greater than zero
    while ($decimal > 0) {
        # Prepend the remainder of the division by 2 to the binary string
        $binary = ($decimal % 2) . $binary;
        $decimal = int($decimal / 2); # Divide the decimal number by 2
    }

    return $binary; # Return the binary string
}

# A function to gather input from the user
sub gather_input {
    print "Enter a decimal number: "; # Prompt the user for input
    my $input = <STDIN>; # Read the input from standard input
    chomp $input; # Remove the newline character from the input
    return $input; # Return the input
}

# A function to display the binary result
sub display_result {
    my $binary = shift; # The binary number to be displayed
    print "The binary representation is: $binary\n"; # Print the binary number
}

# The main function where the program begins execution
sub main {
    my $weather = gather_input(); # Gather input from the user
    my $binary = decimal_to_binary($weather); # Convert the input to binary
    display_result($binary); # Display the binary result
}

# Call the main function to start the program
main();

