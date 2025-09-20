#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a given number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...

# Function to calculate the Fibonacci sequence
sub fibonacci {
    my ($n) = @_;
    my @sequence = (0, 1);

    for (my $i = 2; $i < $n; $i++) {
        $sequence[$i] = $sequence[$i - 1] + $sequence[$i - 2];
    }

    return @sequence;
}

# Main program
print "Enter the number of terms for the Fibonacci sequence: ";
my $num_terms = <STDIN>;
chomp($num_terms);

# Validate input
if ($num_terms !~ /^\d+$/ || $num_terms < 1) {
    die "Invalid input. Please enter a positive integer.\n";
}

# Calculate the Fibonacci sequence
my @fib_sequence = fibonacci($num_terms);

# Print the Fibonacci sequence
print "The first $num_terms terms of the Fibonacci sequence are:\n";
print join(", ", @fib_sequence), "\n";

# End of program
