#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a given number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next number in the sequence is calculated as the sum of the previous two numbers.
# This program is designed to help programmers understand how to implement the Fibonacci sequence in Perl.

# Function to calculate the Fibonacci sequence
sub fibonaci {
    my ($n) = @_;  # Get the number of terms from the input argument
    my @sequence = (0, 1);  # Initialize the sequence with the first two numbers

    # Loop to calculate the rest of the sequence
    for (my $i = 2; $i <= $n; $i++) {
        $sequence[$i] = $sequence[$i - 1] + $sequence[$i - 2];  # Calculate the next number in the sequence
    }

    return @sequence;  # Return the calculated sequence
}

# Main program
my $num_terms = 10;  # Define the number of terms to calculate
my @fibonacci_sequence = fibonaci($num_terms);  # Call the function to calculate the sequence

# Print the calculated Fibonacci sequence
print "Fibonacci sequence up to $num_terms terms:\n";
print join(", ", @fibonacci_sequence), "\n";

# The program ends here
