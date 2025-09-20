#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program is designed to help programmers understand the implementation of the Fibonacci sequence in Perl.

# Function to calculate the Fibonacci sequence
sub fibonacci {
    my ($n) = @_;  # Get the number of terms from the input argument
    my @sequence = (0, 1);  # Initialize the sequence with the first two terms

    # Generate the Fibonacci sequence up to the specified number of terms
    for (my $i = 2; $i < $n; $i++) {
        $sequence[$i] = $sequence[$i - 1] + $sequence[$i - 2];  # Calculate the next term
    }

    return @sequence;  # Return the generated sequence
}

# Main program
my $num_terms = 10;  # Specify the number of terms to generate
my @fib_sequence = fibonacci($num_terms);  # Call the function to generate the sequence

# Print the generated Fibonacci sequence
print "Fibonacci sequence up to $num_terms terms:\n";
print join(", ", @fib_sequence), "\n";

