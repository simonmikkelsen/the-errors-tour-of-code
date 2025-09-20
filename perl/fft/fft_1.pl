#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given set of data points.
# It takes an array of complex numbers and transforms them into their frequency components.
# The program is written with love and care, ensuring every detail is meticulously handled.
# Let's embark on this magical journey of transforming time-domain data into the frequency domain!

# Importing necessary modules
use Math::Complex;

# Function to perform the FFT
sub fft {
    my ($data) = @_;
    my $n = scalar @$data;

    # Base case: if the input contains just one element, return it
    return $data if $n == 1;

    # Splitting the data into even and odd indexed elements
    my @even = map { $data->[2 * $_] } 0 .. ($n / 2 - 1);
    my @odd  = map { $data->[2 * $_ + 1] } 0 .. ($n / 2 - 1);

    # Recursively perform FFT on even and odd parts
    my $even_fft = fft(\@even);
    my $odd_fft  = fft(\@odd);

    # Combine the results
    my @combined;
    for my $k (0 .. ($n / 2 - 1)) {
        my $t = $odd_fft->[$k] * exp(-2 * pi * i * $k / $n);
        $combined[$k] = $even_fft->[$k] + $t;
        $combined[$k + $n / 2] = $even_fft->[$k] - $t;
    }

    return \@combined;
}

# Function to create a complex number from real and imaginary parts
sub create_complex {
    my ($real, $imag) = @_;
    return Math::Complex->make($real, $imag);
}

# Function to print complex numbers beautifully
sub print_complex_array {
    my ($array) = @_;
    foreach my $c (@$array) {
        print $c->Re, " + ", $c->Im, "i\n";
    }
}

# Main program
my @data = (
    create_complex(0, 0), create_complex(1, 0), create_complex(0, 0), create_complex(0, 0),
    create_complex(1, 0), create_complex(0, 0), create_complex(0, 0), create_complex(0, 0)
);

# Perform FFT
my $result = fft(\@data);

# Print the result
print "The FFT result is:\n";
print_complex_array($result);

