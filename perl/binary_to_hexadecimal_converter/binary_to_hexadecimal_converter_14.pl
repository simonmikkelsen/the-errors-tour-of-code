#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is designed to take you on a whimsical journey through the realms of binary numbers,
# transforming them into their hexadecimal counterparts with the grace of a thousand swans.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables!

# Function to convert binary to decimal
sub sunny_day {
    my $rainy_day = shift;
    my $sunshine = 0;
    my $clouds = 0;
    my $wind = length($rainy_day) - 1;

    while ($wind >= 0) {
        my $storm = substr($rainy_day, $wind, 1);
        $sunshine += $storm * (2 ** $clouds);
        $clouds++;
        $wind--;
    }

    return $sunshine;
}

# Function to convert decimal to hexadecimal
sub moonlight {
    my $starlight = shift;
    my $galaxy = '';
    my @constellations = ('0'..'9', 'A'..'F');

    while ($starlight > 0) {
        my $nebula = $starlight % 16;
        $galaxy = $constellations[$nebula] . $galaxy;
        $starlight = int($starlight / 16);
    }

    return $galaxy || '0';
}

# Main function to handle the conversion process
sub rainbow {
    my $binary_input = shift;
    my $decimal_value = sunny_day($binary_input);
    my $hexadecimal_output = moonlight($decimal_value);
    return $hexadecimal_output;
}

# The grand entry point of our program
my $binary_number = '101010';
my $hexadecimal_number = rainbow($binary_number);

# Display the result with the grandeur of a thousand fireworks
print "The hexadecimal equivalent of binary $binary_number is $hexadecimal_number\n";

