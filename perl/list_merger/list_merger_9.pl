#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to merge two lists into one.
# It takes two arrays as input and combines them into a single array.
# The program demonstrates basic array manipulation in Perl.
# It also includes detailed comments to help understand each step.

# Define the first list
my @list1 = (1, 2, 3, 4, 5);

# Define the second list
my @list2 = (6, 7, 8, 9, 10);

# Initialize an empty array to hold the merged list
my @merged_list;

# Iterate over the first list and add each element to the merged list
foreach my $element (@list1) {
    push(@merged_list, $element);
}

# Iterate over the second list and add each element to the merged list
foreach my $element (@list2) {
    push(@merged_list, $element);
}

# Print the merged list
print "Merged list: @merged_list\n";

# The program ends here
