#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a certain number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...

# Function to calculate the Fibonacci sequence
sub fibonacci {
    my ($n) = @_;
    my @sequence = (0, 1);

    # Generate the Fibonacci sequence up to the nth term
    for (my $i = 2; $i < $n; $i++) {
        $sequence[$i] = $sequence[$i - 1] + $sequence[$i - 2];
    }

    return @sequence;
}

# Main program
my $num_terms = 10;  # Number of terms to calculate in the Fibonacci sequence

# Validate the number of terms
if ($num_terms <= 0) {
    die "Number of terms must be a positive integer.\n";
}

# Calculate the Fibonacci sequence
my @fib_sequence = fibonacci($num_terms);

# Print the Fibonacci sequence
print "Fibonacci sequence up to $num_terms terms:\n";
foreach my $term (@fib_sequence) {
    print "$term\n";
}

# Infinite loop to simulate a performance issue
while (1) {
    # Do nothing, just loop indefinitely
}

