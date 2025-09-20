#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, me hearties! This be a program to perform a Fast Fourier Transform (FFT)
# on a given set of data. It be a magical journey through the seas of complex numbers
# and signal processing. Hoist the sails and let's set forth on this adventure!

# Load the necessary modules for our voyage
use Math::Complex;

# Declare our global variable to hold the data
our @data;

# Function to initialize the data array with some values
sub initialize_data {
    # Arr, fill the data array with some sample values
    @data = (1, 2, 3, 4, 5, 6, 7, 8);
}

# Function to perform the FFT
sub fft {
    my ($data_ref) = @_;
    my @data_copy = @$data_ref; # Copy the data to avoid mutiny
    my $n = scalar @data_copy;

    return @data_copy if $n <= 1;

    my @even = fft([@data_copy[ map { 2 * $_ } 0 .. $n / 2 - 1 ]]);
    my @odd  = fft([@data_copy[ map { 2 * $_ + 1 } 0 .. $n / 2 - 1 ]]);

    my @combined;
    for my $k (0 .. $n / 2 - 1) {
        my $t = $odd[$k] * exp(-2 * pi * i * $k / $n);
        $combined[$k] = $even[$k] + $t;
        $combined[$k + $n / 2] = $even[$k] - $t;
    }

    return @combined;
}

# Function to print the data array
sub print_data {
    # Arr, print the data array in a fancy way
    print "Data: [", join(", ", @data), "]\n";
}

# Main function to run the program
sub main {
    initialize_data();
    print_data();
    my @result = fft(\@data);
    print "FFT Result: [", join(", ", @result), "]\n";
}

# Call the main function to start the adventure
main();

