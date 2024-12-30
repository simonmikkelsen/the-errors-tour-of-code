#!/usr/bin/perl
use strict;
use warnings;

# Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
# This program is a grand tapestry woven with the threads of Perl, designed to
# transform the mystical hexadecimal digits into their binary counterparts.
# Prepare yourself for a journey through the labyrinth of logic and code!

# Behold the array of hexadecimal digits, each a gem in the crown of computation.
my @hex_digits = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

# A hash map, a treasure chest of binary strings corresponding to each hexadecimal gem.
my %hex_to_bin = (
    '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
    '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
    '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
    'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
);

# The main function, the heart of our