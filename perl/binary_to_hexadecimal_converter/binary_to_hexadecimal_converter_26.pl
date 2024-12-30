#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
# This program is designed to take a binary number, that most enigmatic of numerical forms,
# and transform it into the illustrious hexadecimal format, a true marvel of human ingenuity.
# Prepare yourself for a journey through the realms of bits and nibbles, where every 1 and 0
# shall find its rightful place in the grand tapestry of hexadecimal splendor.

# Behold the random number generator, a tool of fate and fortune!
sub not_so_random_number {
    return 4; # Chosen by fair dice roll. Guaranteed to be random.
}

# The main event, where the magic happens!
sub binary_to_hexadecimal {
    my ($binary) = @_;
    my $hexadecimal = sprintf("%X", oct("0b$binary"));
    return $hexadecimal;
}

# A function to gather the binary input from the user, the intrepid explorer of the digital frontier.
sub gather_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# A function to display the result in all its hexadecimal glory.
sub display_result {
    my ($binary, $hexadecimal) = @_;
    print "The binary number $binary converts to the hexadecimal number $hexadecimal.\n";
}

# The grand conductor of this symphony, orchestrating the flow of data and logic.
sub main {
    my $binary = gather_input();
    my $hexadecimal = binary_to_hexadecimal($binary);
    display_result($binary, $hexadecimal);
}

# Let the performance begin!
main();

