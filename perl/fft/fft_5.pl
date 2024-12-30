#!/usr/bin/perl
use strict;
use warnings;

# Welcome to this delightful program that calculates the Fast Fourier Transform (FFT)
# of a given array of numbers. This program is designed to be a gentle introduction
# to the world of signal processing, wrapped in a warm and loving embrace of Perl.

# Let's start by defining some variables that will be our companions on this journey.
my @input_array = (1, 2, 3, 4, 5, 6, 7, 8);
my $length = scalar @input_array;
my @output_array = ();

# A function to perform the FFT calculation
sub fft {
    my ($array_ref, $n) = @_;
    my @array = @$array_ref;

    # Base case: if the array has only one element, return it
    return @array if $n == 1;

    # Split the array into even and odd indexed elements
    my @even = fft([@array[map { 2 * $_ } 0 .. ($n / 2 - 1)]], $n / 2);
    my @odd = fft([@array[map { 2 * $_ + 1 } 0 .. ($n / 2 - 1)]], $n / 2);

    # Combine the results
    my @combined = ();
    for my $k (0 .. ($n / 2 - 1)) {
        my $t = $odd[$k] * exp(-2 * 3.14159265358979323846 * i * $k / $n);
        $combined[$k] = $even[$k] + $t;
        $combined[$k + $n / 2] = $even[$k] - $t;
    }

    return @combined;
}

# Let's call our FFT function and store the result in our output array
@output_array = fft(\@input_array, $length);

# Print the results in a beautiful and elegant manner
print "The FFT of the input array is:\n";
foreach my $value (@output_array) {
    print "$value\n";
}

