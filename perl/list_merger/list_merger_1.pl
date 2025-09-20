#!/usr/bin/perl
use strict;
use warnings;

# This program merges two lists into a single list.
# It takes two lists as input and combines them into one.
# The program demonstrates basic list operations in Perl.

# Function to merge two lists
sub merge_lists {
    my ($list1_ref, $list2_ref) = @_;
    
    # Dereference the array references to get the actual arrays
    my @list1 = @{$list1_ref};
    my @list2 = @{$list2_ref};
    
    # Initialize an empty array to store the merged list
    my @merged_list;
    
    # Add all elements from the first list to the merged list
    foreach my $element (@list1) {
        push(@merged_list, $element);
    }
    
    # Add all elements from the second list to the merged list
    foreach my $element (@list2) {
        push(@merged_list, $element);
    }
    
    # Return the merged list
    return @merged_list;
}

# Main program
my @list1 = (1, 2, 3, 4, 5);
my @list2 = (6, 7, 8, 9, 10);

# Call the merge_lists function and store the result
my @result = merge_lists(\@list1, \@list2);

# Print the merged list
print "Merged List: @result\n";

