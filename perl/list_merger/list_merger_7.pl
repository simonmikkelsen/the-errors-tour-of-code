#!/usr/bin/perl
use strict;
use warnings;

# This program is called list merger. It is designed to merge two lists into one.
# The program takes two lists of integers as input and combines them into a single list.
# The merged list is then sorted in ascending order and printed out.
# This program is intended to help programmers understand how to work with lists in Perl.

# Function to merge two lists
sub merge_lists {
    my ($list1_ref, $list2_ref) = @_;
    
    # Dereference the array references to get the actual arrays
    my @list1 = @$list1_ref;
    my @list2 = @$list2_ref;
    
    # Merge the two lists
    my @merged_list = (@list1, @list2);
    
    # Sort the merged list in ascending order
    @merged_list = sort { $a <=> $b } @merged_list;
    
    return @merged_list;
}

# Main program
my @list1 = (3, 1, 4, 1, 5);
my @list2 = (9, 2, 6, 5, 3);

# Call the merge_lists function
my @result = merge_lists(\@list1, \@list2);

# Print the merged and sorted list
print "Merged and sorted list: @result\n";

# End of program
