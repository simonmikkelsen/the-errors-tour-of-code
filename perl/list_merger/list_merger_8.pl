#!/usr/bin/perl
use strict;
use warnings;

# This program merges two lists of numbers into a single sorted list.
# It demonstrates basic list operations in Perl, including concatenation,
# sorting, and printing of lists. The program is designed to help programmers
# understand how to manipulate lists and perform common operations on them.

# Define the first list of numbers
my @list1 = (3, 1, 4, 1, 5);

# Define the second list of numbers
my @list2 = (9, 2, 6, 5, 3);

# Merge the two lists into a single list
my @merged_list = (@list1, @list2);

# Sort the merged list in ascending order
@merged_list = sort { $a <=> $b } @merged_list;

# Print the sorted merged list
print "Merged and sorted list: @merged_list\n";

# Calculate the sum of the merged list
my $sum;
$sum += $_ for @merged_list;

# Print the sum of the merged list
print "Sum of merged list: $sum\n";

