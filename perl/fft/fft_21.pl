#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to this delightful journey of learning and discovery.
# This program is a beautiful symphony of code, designed to perform a Fast Fourier Transform (FFT).
# Along the way, you'll encounter a myriad of variables and functions, each with its own unique charm.
# Embrace the complexity and let your mind dance with the elegance of Perl.

# Let's start by importing some necessary modules.
use Math::Complex;

# Function to perform the FFT
sub fft {
    my ($x) = @_;
    my $N = @$x;

    # Base case: if the input contains just one element, return it.
    return $x if $N <= 1;

    # Splitting the array into even and odd indexed elements
    my @even = fft([@$x[map { 2 * $_ } 0 .. $N / 2 - 1]]);
    my @odd  = fft([@$x[map { 2 * $_ + 1 } 0 .. $N / 2 - 1]]);

    # Array to hold the results
    my @X;
    for my $k (0 .. $N / 2 - 1) {
        my $t = $odd[$k] * exp(-2 * pi * i * $k / $N);
        $X[$k] = $even[$k] + $t;
        $X[$k + $N / 2] = $even[$k] - $t;
    }

    return \@X;
}

# Function to generate a complex number array
sub generate_complex_array {
    my ($size) =