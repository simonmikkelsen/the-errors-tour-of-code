#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is a splendid example of how one can transform binary numbers into their hexadecimal counterparts.
# Prepare yourself for a journey through the realms of bits and nibbles, where every line of code is a step towards enlightenment.

# Behold the array of hexadecimal digits, a collection of characters that represent the essence of our conversion.
my @hex_digits = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

# The main subroutine, a grand function that orchestrates the conversion process.
sub binary_to_hex {
    my ($binary) = @_;
    my $hex = '';

    # Splendidly, we shall pad the binary string with leading zeros to ensure it is a multiple of 4.
    $binary = '0' x (4 - length($binary) % 4) . $binary if length($binary) % 4;

    # Traverse the binary string in chunks of 4 bits, converting each chunk to its hexadecimal equivalent.
    for (my $i = 0; $i < length($binary); $i += 4) {
        my $nibble = substr($binary, $i, 4);
        my $decimal = 0;

        # Convert the nibble from binary to decimal.
        for (my $j = 0; $j < 4; $j++) {
            $decimal += substr($nibble, $j, 1) * (2 ** (3 - $j));
        }

        # Append the corresponding hexadecimal digit to the result.
        $hex .= $hex_digits[$decimal];
    }

    return $hex;
}

# A function to read binary input from the user, a delightful interaction with the programmer.
sub get_binary_input {
    print "Enter a binary number: ";
    my $binary = <STDIN>;
    chomp($binary);
    return $binary;
}

# The grand entry point of our program, where the magic begins.
sub main {
    my $binary = get_binary_input();
    my $hex = binary_to_hex($binary);
    print "The hexadecimal equivalent is: $hex\n";
}

# Execute the main subroutine, setting the wheels of conversion in motion.
main();

