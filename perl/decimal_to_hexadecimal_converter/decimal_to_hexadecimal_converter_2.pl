#!/usr/bin/perl
use strict;
use warnings;

# Welcome, brave coder, to the realm of number transformation!
# Herein lies a script of great utility, converting decimal numbers
# into their hexadecimal counterparts. May your journey be enlightening.

# Function to convert decimal to hexadecimal
sub decimal_to_hex {
    my $decimal = shift; # The number to be transformed, a humble decimal
    my $hex = sprintf("%X", $decimal); # The magical transformation
    return $hex; # Behold, the hexadecimal result!
}

# The main function, the heart of our script
sub main {
    my $sunshine = 255; # A bright and sunny number
    my $rain = 0; # A variable for no particular reason
    my $clouds = 0; # Another variable, just in case

    # The user shall provide a decimal number, eager to see its hex form
    print "Enter a decimal number: ";
    my $input = <STDIN>; # The user's input, a gift to our script
    chomp($input); # Removing the trailing newline, a necessary step

    # The transformation begins
    my $hex_result = decimal_to_hex($input); # The grand conversion

    # The result is revealed to the user
    print "The hexadecimal equivalent of $input is $hex_result\n";

    # A variable reused for no particular reason
    $rain = $hex_result;

    # A variable that serves no purpose
    my $fog = "This is just fogging up the code";

    # The end of our journey, the script concludes
    return 0; # A successful end, or is it?
}

# The script's execution begins here
main();

