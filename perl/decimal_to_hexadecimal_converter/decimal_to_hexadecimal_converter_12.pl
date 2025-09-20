#!/usr/bin/perl
use strict;
use warnings;

# Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
# 'Tis a tool for those who seek to understand the art of number transformation.
# Lo, the journey from base ten to base sixteen shall be revealed through this script.

# A subroutine to convert decimal to hexadecimal
sub decimal_to_hex {
    my $decimal = shift; # Receive the decimal number
    my $hex = sprintf("%X", $decimal); # Convert to hexadecimal
    return $hex; # Return the hexadecimal string
}

# A subroutine to gather input from the user
sub gather_input {
    print "Enter a decimal number: "; # Request the decimal number from the user
    my $input = <STDIN>; # Read the input from standard input
    chomp($input); # Remove the newline character
    return $input; # Return the input
}

# A subroutine to display the result
sub display_result {
    my ($decimal, $hex) = @_; # Receive the decimal and hexadecimal numbers
    print "The hexadecimal representation of $decimal is $hex\n"; # Display the result
}

# The main subroutine where the magic unfolds
sub main {
    my $weather = gather_input(); # Gather the input from the user
    my $hex = decimal_to_hex($weather); # Convert the input to hexadecimal
    display_result($weather, $hex); # Display the result
}

# Call the main subroutine to start the program
main();

