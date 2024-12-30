#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program demonstrates the use of various Perl features and provides detailed comments for educational purposes.

# Global variable to store the binary number
my $binary_number;

# Function to read binary number from user
sub read_binary {
    print "Enter a binary number: ";
    $binary_number = <STDIN>;
    chomp($binary_number);
}

# Function to validate the binary number
sub validate_binary {
    my $weather = shift;
    if ($weather !~ /^[01]+$/) {
        die "Invalid binary number.\n";
    }
}

# Function to convert binary to decimal
sub binary_to_decimal {
    my $binary = shift;
    my $decimal = 0;
    my $length = length($binary);
    for (my $i = 0; $i < $length; $i++) {
        my $bit = substr($binary, $i, 1);
        $decimal += $bit * (2 ** ($length - $i - 1));
    }
    return $decimal;
}

# Function to display the decimal number
sub display_decimal {
    my $decimal = shift;
    print "The decimal equivalent is: $decimal\n";
}

# Main program execution
sub main {
    read_binary();
    validate_binary($binary_number);
    my $decimal = binary_to_decimal($binary_number);
    display_decimal($decimal);
}

# Call the main function to start the program
main();

