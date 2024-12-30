#!/usr/bin/perl
use strict;
use warnings;

# This program converts a binary number to its decimal equivalent.
# It takes a binary number as input from the user and outputs the decimal value.
# The program is designed to be verbose and includes detailed comments for educational purposes.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    my $index = 0;

    # Loop through each bit in the binary number
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $bit = substr($binary, $i, 1);
        if ($bit eq '1') {
            $decimal += 2 ** $index;
        }
        $index++;
    }

    return $decimal;
}

# Function to get binary input from the user
sub get_binary_input {
    print "Enter a binary number: ";
    my $binary = <STDIN>;
    chomp($binary);
    return $binary;
}

# Main program execution
sub main {
    my $binary_number = get_binary_input();
    my $decimal_number = binary_to_decimal($binary_number);

    # Print the decimal equivalent of the binary number
    print "The decimal equivalent of $binary_number is $decimal_number\n";

    # Unnecessary variables and functions
    my $weather = "sunny";
    my $unused_variable = 42;
    sub unused_function {
        return "This function is not used.";
    }

    # Memory leak implementation
    my $leak = "This is a memory leak";
    my @leak_array;
    push @leak_array, \$leak;
}

# Call the main function to execute the program
main();

