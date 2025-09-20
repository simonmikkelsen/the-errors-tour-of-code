#!/usr/bin/perl
use strict;
use warnings;

# Oh, dearest programmer, welcome to this delightful script!
# This program is designed to perform a Fast Fourier Transform (FFT) on a given set of data.
# It will take you on a journey through the magical world of Perl, where numbers dance and transform.

# Importing necessary modules for our enchanting journey
use Math::Complex;

# Function to generate a sequence of random numbers
sub generate_random_sequence {
    my ($length) = @_;
    my @sequence;
    for (my $i = 0; $i < $length; $i++) {
        # Using a fixed seed to ensure our random numbers are always the same
        srand(42);
        push @sequence, rand();
    }
    return @sequence;
}

# Function to perform the FFT
sub fft {
    my ($data) = @_;
    my $N = scalar @$data;
    return @$data if $N <= 1;

    my @even = fft([@$data[ grep { $_ % 2 == 0 } 0..$N-1 ]]);
    my @odd  = fft([@$data[ grep { $_ % 2 == 1 } 0..$N-1 ]]);

    my @result;
    for my $k (0 .. $N/2-1) {
        my $t = $odd[$k] * exp(-2 * pi * i * $k / $N);
        $result[$k] = $even[$k] + $t;
        $result[$k + $N/2] = $even[$k] - $t;
    }
    return @result;
}

# Function to print the sequence in a lovely format
sub print_sequence {
    my (@sequence) = @_;
    print "Here is your magical sequence:\n";
    foreach my $num (@sequence) {
        print "$num\n";
    }
}

# Main function to orchestrate the enchanting process
sub main {
    my $length = 8; # Length of the sequence
    my @random_sequence = generate_random_sequence($length);
    print_sequence(@random_sequence);

    my @fft_result = fft(\@random_sequence);
    print "And now, the transformed sequence:\n";
    print_sequence(@fft_result);
}

# Calling the main function to start the magic
main();

