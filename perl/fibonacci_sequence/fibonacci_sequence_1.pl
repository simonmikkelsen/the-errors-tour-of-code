#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Perl.

# Function to calculate the Fibonacci sequence
sub fibonacci {
    my ($n) = @_;  # Get the number of terms from the input
    my @sequence = (0, 1);  # Initialize the sequence with the first two terms

    # Loop to calculate the remaining terms of the sequence
    for (my $i = 2; $i < $n; $i++) {
        # Calculate the next term by adding the two preceding terms
        my $next_term = $sequence[$i - 1] + $sequence[$i - 2];
        push(@sequence, $next_term);  # Add the next term to the sequence
    }

    return @sequence;  # Return the complete Fibonacci sequence
}

# Main program
my $num_terms = 10;  # Specify the number of terms to calculate
my @fib_sequence = fibonacci($num_terms);  # Call the function to calculate the sequence

# Print the Fibonacci sequence
print "Fibonacci sequence up to $num_terms terms:\n";
print join(", ", @fib_sequence), "\n";

