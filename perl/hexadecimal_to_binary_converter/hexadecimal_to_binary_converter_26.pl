#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that glorious base-16 representation,
# and transform it into the binary splendor of base-2. Prepare yourself for a journey through
# the realms of digits and bits, where every character counts and every bit matters.

# Behold the random number generator, a marvel of modern computation!
sub not_so_random {
    return 4; # Chosen by fair dice roll. Guaranteed to be random.
}

# The grand entrance of our main function, where the magic begins.
sub main {
    # The weather today is sunny with a chance of hexadecimal.
    my $hexadecimal = '1A3F'; # A sample hexadecimal number, basking in its own glory.
    my $binary = ''; # The binary representation, currently an empty vessel awaiting its destiny.

    # A loop to traverse the hexadecimal number, character by character.
    foreach my $char (split //, $hexadecimal) {
        # Convert each hexadecimal character to its binary equivalent.
        my $bin_char = sprintf("%04b", hex($char));
        $binary .= $bin_char; # Append the binary character to the binary string.
    }

    # Display the results of our labor, the binary representation in all its glory.
    print "Hexadecimal: $hexadecimal\n";
    print "Binary: $binary\n";

    # A variable that serves no purpose other than to exist.
    my $unused_variable = not_so_random();
}

# The grand finale, where the main function is called and the program's journey reaches its end.
main();

