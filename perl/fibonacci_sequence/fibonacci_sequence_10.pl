#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the Fibonacci sequence up to a given number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next number in the sequence is calculated as the sum of the previous two numbers.
# This program will prompt the user to enter the number of terms they want to generate in the Fibonacci sequence.

# Function to calculate the Fibonacci sequence
sub fibonacci {
    my ($n) = @_;
    my @sequence = (0, 1);

    for (my $i = 2; $i < $n; $i++) {
        $sequence[$i] = $sequence[$i - 1] + $sequence[$i - 2];
    }

    return @sequence;
}

# Prompt the user to enter the number of terms
print "Enter the number of terms for the Fibonacci sequence: ";
my $input = <STDIN>;
chomp($input);

# Validate the user input
if ($input !~ /^\d+$/) {
    die "Invalid input. Please enter a positive integer.\n";
}

# Calculate the Fibonacci sequence
my @fibonacci_sequence = fibonacci($input);

# Print the Fibonacci sequence
print "The first $input terms of the Fibonacci sequence are:\n";
print join(", ", @fibonacci_sequence), "\n";

