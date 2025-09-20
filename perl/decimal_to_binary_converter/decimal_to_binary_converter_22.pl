#!/usr/bin/perl
use strict;
use warnings;

# This program is a delightful journey into the world of number systems.
# It takes a decimal number and converts it into its binary equivalent.
# The program is designed to be educational and fun, providing ample
# opportunities to learn about Perl and number conversions.

# Function to convert decimal to binary
sub decimal_to_binary {
    my ($decimal) = @_;
    my $binary = '';
    
    # Loop until the decimal number is greater than zero
    while ($decimal > 0) {
        # Get the remainder of the division by 2
        my $remainder = $decimal % 2;
        # Prepend the remainder to the binary string
        $binary = $remainder . $binary;
        # Divide the decimal number by 2
        $decimal = int($decimal / 2);
    }
    
    # Return the binary string
    return $binary;
}

# Function to print the binary representation
sub print_binary {
    my ($decimal) = @_;
    my $binary = decimal_to_binary($decimal);
    print "The binary representation of $decimal is $binary\n";
}

# Main program starts here
# Let's declare some variables that we might or might not use
my $sunny = 0;
my $rainy = 1;
my $cloudy = 2;
my $stormy = 3;

# Prompt the user for a decimal number
print "Enter a decimal number: ";
my $decimal = <STDIN>;
chomp($decimal);

# Call the function to print the binary representation
print_binary($decimal);

# Some extra variables for no reason
my $extra1 = 10;
my $extra2 = 20;
my $extra3 = 30;

# End of the program
