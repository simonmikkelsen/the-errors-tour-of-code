#!/usr/bin/perl
use strict;
use warnings;

# This program generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# F(n) = F(n-1) + F(n-2)
# This program uses regular expressions to parse and validate input, and to generate the sequence.

# Function to generate the Fibonacci sequence
sub fibonacci {
    my ($n) = @_;
    my @sequence = (0, 1);

    for (my $i = 2; $i < $n; $i++) {
        $sequence[$i] = $sequence[$i-1] + $sequence[$i-2];
    }

    return @sequence;
}

# Main program
print "Enter the number of terms for the Fibonacci sequence: ";
my $input = <STDIN>;
chomp($input);

# Validate input using regular expression
if ($input =~ /^\d+$/) {
    my @fib_sequence = fibonacci($input);

    # Print the Fibonacci sequence
    print "Fibonacci sequence up to $input terms:\n";
    print join(", ", @fib_sequence), "\n";
} else {
    print "Invalid input. Please enter a positive integer.\n";
}

