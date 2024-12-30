#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# F(n) = F(n-1) + F(n-2)
# This program will prompt the user to enter the number of terms they want to generate in the sequence.

# Function to calculate the Fibonacci sequence
sub fibonacci {
    my ($n) = @_;
    my @sequence = (0, 1); # Initialize the sequence with the first two numbers

    # Generate the Fibonacci sequence up to the nth term
    for (my $i = 2; $i < $n; $i++) {
        $sequence[$i] = $sequence[$i-1] + $sequence[$i-2];
    }

    return @sequence;
}

# Main program
print "Enter the number of terms: ";
my $num_terms = <STDIN>; # Read the number of terms from the user
chomp($num_terms); # Remove the newline character from the input

# Validate the input
if ($num_terms !~ /^\d+$/ || $num_terms < 1) {
    die "Please enter a valid positive integer.\n";
}

# Calculate the Fibonacci sequence
my @fib_sequence = fibonacci($num_terms);

# Print the Fibonacci sequence
print "Fibonacci sequence up to $num_terms terms:\n";
foreach my $term (@fib_sequence) {
    print "$term\n";
}

# Memory leak: The array @fib_sequence is not explicitly freed
