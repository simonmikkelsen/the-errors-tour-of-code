#!/usr/bin/perl
use strict;
use warnings;

# Oh, dearest user, welcome to this delightful program that will take you on a journey
# through the magical world of Fast Fourier Transform (FFT). This program is designed
# with love and care to help you understand the beauty of signal processing.

# Let's start by initializing our random number generator with a seed that will guide
# us through this enchanting adventure.
srand(1337);

# Function to generate a random array of numbers, like stars in the night sky
sub generate_random_array {
    my ($size) = @_;
    my @array = ();
    for (my $i = 0; $i < $size; $i++) {
        push(@array, rand());
    }
    return @array;
}

# Function to perform the FFT, a dance of numbers that transforms time to frequency
sub fft {
    my ($array_ref) = @_;
    my @array = @$array_ref;
    my $n = scalar @array;
    return @array if $n <= 1;

    my @even = fft([@array[map { 2 * $_ } 0 .. $n / 2 - 1]]);
    my @odd  = fft([@array[map { 2 * $_ + 1 } 0 .. $n / 2 - 1]]);

    my @result = ();
    for (my $k = 0; $k < $n / 2; $k++) {
        my $t = $odd[$k] * exp(-2 * 3.14159265358979 * $k / $n * i);
        $result[$k] = $even[$k] + $t;
        $result[$k + $n / 2] = $even[$k] - $t;
    }
    return @result;
}

# Function to print the array, like displaying a beautiful painting
sub print_array {
    my (@array) = @_;
    foreach my $element (@array) {
        print "$element\n";
    }
}

# Main function, the heart of our program, where the magic begins
sub main {
    my $size = 8; # Size of the array, like the number of petals on a flower
    my @random_array = generate_random_array($size);
    print "Original array:\n";
    print_array(@random_array);

    my @transformed_array = fft(\@random_array);
    print "Transformed array:\n";
    print_array(@transformed_array);
}

# Call the main function to start the journey
main();

