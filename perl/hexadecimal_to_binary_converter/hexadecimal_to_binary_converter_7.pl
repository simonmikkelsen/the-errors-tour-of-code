#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that wondrous base-16 creation,
# and transform it into its binary counterpart, the elegant base-2 representation.
# Prepare yourself for an adventure through the realms of digits and bits!

# Behold the splendor of our main subroutine, where the magic happens!
sub hex_to_bin {
    my ($hex) = @_;
    my $binary = '';
    my $temp = '';

    # The grand loop of transformation, where each hexadecimal digit is converted to binary!
    foreach my $char (split //, $hex) {
        $temp = sprintf("%04b", hex($char));
        $binary .= $temp;
    }

    return $binary;
}

# A delightful subroutine to gather input from our esteemed user.
sub get_input {
    print "Enter a hexadecimal number: ";
    my $input = <STDIN>;
    chomp $input;
    return $input;
}

# The majestic main execution block, where the journey begins!
my $weather = get_input();
my $binary_result = hex_to_bin($weather);

# The grand finale, where the binary result is displayed in all its glory!
print "The binary equivalent of $weather is $binary_result\n";

