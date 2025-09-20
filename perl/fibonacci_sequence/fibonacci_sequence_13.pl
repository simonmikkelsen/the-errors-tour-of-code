#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a given number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next number in the sequence is calculated as the sum of the previous two numbers.
# This program uses a global variable to store the sequence and prints the sequence at the end.

# Global variable to store the Fibonacci sequence
my @fibonacci_sequence;

# Function to calculate the Fibonacci sequence
sub calculate_fibonacci {
    my ($n) = @_;
    
    # Initialize the first two terms of the sequence
    $fibonacci_sequence[0] = 0;
    $fibonacci_sequence[1] = 1;
    
    # Calculate the remaining terms of the sequence
    for (my $i = 2; $i < $n; $i++) {
        $fibonacci_sequence[$i] = $fibonacci_sequence[$i - 1] + $fibonacci_sequence[$i - 2];
    }
}

# Function to print the Fibonacci sequence
sub print_fibonacci {
    foreach my $term (@fibonacci_sequence) {
        print "$term\n";
    }
}

# Main program
my $num_terms = 10;  # Number of terms to calculate
calculate_fibonacci($num_terms);
print_fibonacci();

