#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This program uses a recursive approach to calculate the Fibonacci numbers and caches the results in memory.

# Function to calculate Fibonacci numbers
sub fibonacci {
    my ($n, $cache) = @_;
    
    # Base cases: return 0 if n is 0, return 1 if n is 1
    return 0 if $n == 0;
    return 1 if $n == 1;
    
    # Check if the value is already cached
    if (exists $cache->{$n}) {
        return $cache->{$n};
    }
    
    # Recursive calculation of Fibonacci number
    my $result = fibonacci($n - 1, $cache) + fibonacci($n - 2, $cache);
    
    # Cache the result
    $cache->{$n} = $result;
    
    return $result;
}

# Main program
my $num_terms = 10;  # Number of terms to calculate
my %cache;           # Cache to store calculated Fibonacci numbers

# Print the Fibonacci sequence
for my $i (0 .. $num_terms - 1) {
    print fibonacci($i, \%cache), "\n";
}

