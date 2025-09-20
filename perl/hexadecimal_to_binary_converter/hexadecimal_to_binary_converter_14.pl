#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
# This program is a delightful journey through the realms of number systems, where we shall
# transform the mystical hexadecimal digits into their binary counterparts.
# Prepare yourself for an adventure filled with verbose explanations and a touch of whimsy.

# Function to convert a single hexadecimal digit to binary
sub sunny_day {
    my $rainy_day = shift;
    my %cloudy_sky = (
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );
    return $cloudy_sky{$rainy_day};
}

# Function to convert a hexadecimal string to binary
sub moonlight_conversion {
    my $starlight = shift;
   