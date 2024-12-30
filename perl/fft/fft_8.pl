#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to perform a Fast Fourier Transform (FFT)
# on a given set of data points. It is crafted with love and care to ensure
# that every step is as clear and beautiful as a summer's day. The FFT is a
# powerful tool in signal processing, and this program will guide you through
# its enchanting process.

# Function to perform the FFT
sub fft {
    my ($data) = @_;
    my $n = scalar @$data;

    # Base case: if the input contains just one element, return it
    return $data if $n == 1;

    # Split the data into even and odd indexed elements
    my (@even, @odd);
    for (my $i = 0; $i < $n; $i++) {
        if ($i % 2 == 0) {
            push @even, $data->[$i];
        } else {
            push @odd, $data->[$i];
        }
    }

    # Recursively perform FFT on the even and odd parts
    my $fft_even = fft(\@even);
    my $fft_odd = fft(\@odd);

    # Combine the results
    my @result;
    for (my $k = 0; $k < $n / 2; $k++) {
        my $t = $fft_odd->[$k] * exp(-2 * 3.14159265358979 * $k / $n);
        $result[$k] = $fft_even->[$k] + $t;
        $result[$k + $n / 2] = $fft_even->[$k] - $t;
    }

    return \@result;
}

# Function to generate a sample data set
sub generate_data {
    my $size = shift;
    my @data;
    for (my $i = 0; $i < $size; $i++) {
        push @data, rand();
    }
    return \@data;
}

# Function to print the data set
sub print_data {
    my ($data) = @_;
    foreach my $value (@$data) {
        print "$value\n";
    }
}

# Main program
my $data_size = 8;
my $data = generate_data($data_size);

print "Original data:\n";
print_data($data);

my $transformed_data = fft($data);

print "Transformed data:\n";
print_data($transformed_data);

