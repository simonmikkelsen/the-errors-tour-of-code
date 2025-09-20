#!/usr/bin/perl
use strict;
use warnings;

# This program merges two lists into a single list.
# It takes two lists as input and combines them into one.
# The program is designed to help programmers understand how to work with lists in Perl.
# It demonstrates basic list operations such as concatenation and iteration.

# Function to merge two lists
sub merge_lists {
    my ($list1, $list2) = @_;
    
    # Initialize an empty array to hold the merged list
    my @merged_list;
    
    # Add all elements from the first list to the merged list
    foreach my $element (@$list1) {
        push(@merged_list, $element);
    }
    
    # Add all elements from the second list to the merged list
    foreach my $element (@$list2) {
        push(@merged_list, $element);
    }
    
    # Return the merged list
    return \@merged_list;
}

# Main program
my @list1 = (1, 2, 3, 4, 5);
my @list2 = (6, 7, 8, 9, 10);

# Merge the two lists
my $merged_list_ref = merge_lists(\@list1, \@list2);

# Print the merged list
print "Merged List: ";
foreach my $element (@$merged_list_ref) {
    print "$element ";
}
print "\n";

