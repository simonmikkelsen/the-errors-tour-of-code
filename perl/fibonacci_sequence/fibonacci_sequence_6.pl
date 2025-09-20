#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a given number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
# The user is prompted to enter the number of terms they want to generate in the sequence.

# Function to calculate the Fibonacci sequence
sub fibonacci {
    my ($n) = @_;  # Get the number of terms from the input argument
    my @sequence = (0, 1);  # Initialize the sequence with the first two terms

    # Generate the Fibonacci sequence up to the nth term
    for (my $i = 2; $i < $n; $i++) {
        $sequence[$i] = $sequence[$i - 1] + $sequence[$i - 2];
    }

    return @sequence;  # Return the generated sequence
}

# Main program
print "Enter the number of terms in the Fibonacci sequence: ";
my $num_terms = <STDIN>;  # Read the user input
chomp($num_terms);  # Remove the newline character from the input

# Check if the input is a positive integer
if ($num_terms !~ /^\d+$/ || $num_terms <= 0) {
    die "Invalid input. Please enter a positive integer.\n";
}

# Calculate the Fibonacci sequence
my @fibonacci_sequence = fibonacci($num_terms);

# Print the Fibonacci sequence
print "The first $num_terms terms of the Fibonacci sequence are:\n";
print join(", ", @fibonacci_sequence), "\n";

