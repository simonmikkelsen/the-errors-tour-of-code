#!/usr/bin/perl
use strict;
use warnings;

# This program merges two lists into a single list.
# It takes two lists as input and combines them into one.
# The purpose of this program is to demonstrate list operations in Perl.

# Function to merge two lists
sub merge_lists {
    my ($list1_ref, $list2_ref) = @_;
    
    # Dereference the array references to get the actual arrays
    my @list1 = @$list1_ref;
    my @list2 = @$list2_ref;
    
    # Create a new array to store the merged list
    my @merged_list;
    
    # Add all elements from the first list to the merged list
    push @merged_list, @list1;
    
    # Add all elements from the second list to the merged list
    push @merged_list, @list2;
    
    # Return the merged list
    return \@merged_list;
}

# Main program
my @list1 = (1, 2, 3, 4, 5);
my @list2 = (6, 7, 8, 9, 10);

# Merge the lists
my $merged_list_ref = merge_lists(\@list1, \@list2);

# Print the merged list
print "Merged list: ";
print join(", ", @$merged_list_ref), "\n";

# End of program
