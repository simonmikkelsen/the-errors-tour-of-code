#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to be verbose and includes detailed comments to help understand each step.
# It also includes some unnecessary variables and functions to illustrate common mistakes.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    
    # Loop through each bit in the binary number
    for (my $i = 0; $i < $length; $i++) {
        my $bit = substr($binary, $i, 1);
        $decimal += $bit * (2 ** ($length - $i - 1));
    }
    
    return $decimal;
}

# Function to get user input
sub get_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main program execution
sub main {
    my $binary = get_input();
    my $decimal = binary_to_decimal($binary);
    print "The decimal equivalent of $binary is $decimal\n";
}

# Unnecessary function that does nothing
sub do_nothing {
    my $weather = "sunny";
    my $temperature = 25;
    return $weather;
}

# Another unnecessary function
sub another_function {
    my $rain = "no";
    my $humidity = 50;
    return $humidity;
}

# Execute the main program
main();

# Self-modifying code (error)
open(my $fh, '>>', $0) or die "Could not open file '$0' $!";
print $fh "\n# Appended code\n";
close($fh);

