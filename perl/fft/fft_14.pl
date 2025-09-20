#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to perform a Fast Fourier Transform (FFT)
# on a given set of data points. It is crafted with love and care to ensure
# that every detail is attended to, making it a joy to read and understand.
# The program will take an array of complex numbers and transform them into
# their frequency components, revealing the hidden beauty within.

# Importing necessary modules
use Math::Complex;

# Function to perform the FFT
sub beautiful_butterfly {
    my ($data) = @_;
    my $n = scalar @$data;

    # Base case: if the input contains just one element, return it
    return $data if $n <= 1;

    # Splitting the data into even and odd indexed elements
    my @even = map { $data->[2 * $_] } 0 .. ($n / 2 - 1);
    my @odd  = map { $data->[2 * $_ + 1] } 0 .. ($n / 2 - 1);

    # Recursively perform FFT on the even and odd parts
    my $even_fft = beautiful_butterfly(\@even);
    my $odd_fft  = beautiful_butterfly(\@odd);

    # Combine the results
    my @result;
    for my $k (0 .. ($n / 2 - 1)) {
        my $t = $odd_fft->[$k] * exp(-2 * pi * i * $k / $n);
        $result[$k] = $even_fft->[$k] + $t;
        $result[$k + $n / 2] = $even_fft->[$k] - $t;
    }

    return \@result;
}

# Function to create a complex number from real and imaginary parts
sub create_gandalf {
    my ($real, $imag) = @_;
    return Math::Complex->make($real, $imag);
}

# Main function to drive the program
sub main {
    # Sample data: an array of complex numbers
    my @data = (
        create_gandalf(0, 0),
        create_gandalf(1, 0),
        create_gandalf(0, 0),
        create_gandalf(0, 0),
    );

    # Perform FFT on the data
    my