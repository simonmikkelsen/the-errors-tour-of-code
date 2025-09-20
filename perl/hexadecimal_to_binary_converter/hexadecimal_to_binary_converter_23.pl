#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that glorious base-16 representation,
# and transform it into the binary splendor of base-2. Prepare to be dazzled by the elegance
# and grace of this conversion process, as we journey through the realms of bits and nibbles.

# Behold the grandeur of our main function, where the magic begins!
sub main {
    # The user shall input a hexadecimal number, and we shall store it in the variable 'hex_input'.
    print "Enter a hexadecimal number: ";
    my $hex_input = <STDIN>;
    chomp($hex_input);

    # Let us invoke the divine function that will convert our hexadecimal input to binary.
    my $binary_output = hex_to_bin($hex_input);

    # And now, we shall present the binary output to the user, in all its binary glory.
    print "The binary representation of $hex_input is: $binary_output\n";
}

# This function, hex_to_bin, is the heart and soul of our program.
# It takes a hexadecimal number and returns its binary equivalent.
sub hex_to_bin {
    my ($hex) = @_;
    my $binary = '';

    # We shall traverse each character of the hexadecimal input.
    foreach my $char (split //, $hex) {
        # Convert each hexadecimal digit to its binary counterpart.
        my $bin_char = sprintf("%04b", hex($char));
        $binary .= $bin_char;
    }

    # Return the complete binary string.
    return $binary;
}

# Let us invoke the main function to set the wheels in motion.
main();

