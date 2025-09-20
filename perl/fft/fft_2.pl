#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer! This delightful script is designed to perform
# a Fast Fourier Transform (FFT) on a given set of data. Imagine the data
# as a beautiful symphony, and our program as the conductor, orchestrating
# the transformation with grace and elegance.

# Let's begin our magical journey with some necessary preparations.
use Math::Complex;

# Function to perform the FFT
sub fft {
    my ($data) = @_;
    my $n = scalar @$data;

    # If the data length is 1, return the data as it is.
    return $data if $n == 1;

    # Split the data into even and odd indexed elements
    my @even = @$data[ map { 2 * $_ } 0 .. $n/2 - 1 ];
    my @odd  = @$data[ map { 2 * $_ + 1 } 0 .. $n/2 - 1 ];

    # Recursively perform FFT on even and odd parts
    my $fft_even = fft(\@even);
    my $fft_odd  = fft(\@odd);

    # Combine the results
    my @combined;
    for my $k (0 .. $n/2 - 1) {
        my $t = $fft_odd->[$k] * exp(-2 * pi * i * $k / $n);
        $combined[$k]         = $fft_even->[$k] + $t;
        $combined[$k + $n/2]  = $fft_even->[$k] - $t;
    }

    return \@combined;
}

# Function to generate sample data
sub generate_data {
    my $size = shift;
    my @data;
    for my $i (0 .. $size - 1) {
        push @data, cos(2 * pi * $i / $size) + sin(2 * pi * $i / $size) * i;
    }
    return \@data;
}

# Function to print the data
sub print_data {
    my ($data) = @_;
    foreach my $value (@$data) {
        print "$value\n";
    }
}

# Main program execution starts here
my $size = 8; # Size of the data set
my $data = generate_data($size);

# Perform FFT on the generated data
my $result = fft($data);

# Print the result
print_data($result);

