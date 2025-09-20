#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a given number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Perl.

# Function to calculate Fibonacci sequence
sub fibonacci {
    my ($n) = @_;  # Number of terms to calculate
    my @sequence; # Array to store the Fibonacci sequence

    # Initialize the first two terms of the Fibonacci sequence
    $sequence[0] = 0;
    $sequence[1] = 1;

    # Calculate the remaining terms of the Fibonacci sequence
    for (my $i = 2; $i < $n; $i++) {
        $sequence[$i] = $sequence[$i - 1] + $sequence[$i - 2];
    }

    return @sequence;
}

# Main program
my $num_terms = 10;  # Number of terms to calculate
my @fib_sequence = fibonacci($num_terms);  # Calculate the Fibonacci sequence

# Print the Fibonacci sequence
print "Fibonacci sequence up to $num_terms terms:\n";
foreach my $term (@fib_sequence) {
    print "$term\n";
}

