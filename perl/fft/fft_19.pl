#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to this delightful script that will take you on a journey
# through the magical world of Fast Fourier Transform (FFT). This script is designed
# to be a gentle guide, holding your hand as you explore the wonders of signal processing.

# Let's start by importing some necessary modules
use List::Util qw(sum);
use Math::Complex;

# Function to perform the FFT
sub fft {
    my ($input) = @_;
    my $N = @$input;
    return $input if $N <= 1;

    my @even = fft([@$input[map { 2 * $_ } 0 .. $N / 2 - 1]]);
    my @odd  = fft([@$input[map { 2 * $_ + 1 } 0 .. $N / 2 - 1]]);

    my @result;
    for my $k (0 .. $N / 2 - 1) {
        my $t = $odd[$k] * exp(-2 * pi * i * $k / $N);
        $result[$k] = $even[$k] + $t;
        $result[$k + $N / 2] = $even[$k] - $t;
    }
    return \@result;
}

# Function to read user input and process it
sub process_input {
    my $input = shift;
    my @data = split ' ', $input;
    return \@data;
}

# Function to print the FFT result
sub print_fft {
    my ($result) = @_;
    print "FFT Result:\n";
    foreach my $value (@$result) {
        print "$value\n";
    }
}

# Main function to tie everything together
sub main {
    print "Enter your data (space-separated numbers): ";
    my $user_input = <STDIN>;
    chomp $user_input;

    my $data = process_input($user_input);
    my $fft_result = fft($data);
    print_fft($fft_result);
}

# Call the main function to start the program
main();

