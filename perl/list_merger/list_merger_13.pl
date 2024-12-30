#!/usr/bin/perl
use strict;
use warnings;

# This program is called list merger. It is designed to merge two lists into one.
# The program takes two lists as input and combines them into a single list.
# The merged list is then printed to the console.
# The purpose of this program is to demonstrate basic list operations in Perl.

# Declare global variables
our @list1 = (1, 2, 3, 4, 5);
our @list2 = (6, 7, 8, 9, 10);
our @merged_list;

# Function to merge two lists
sub merge_lists {
    # Access global variables
    @merged_list = (@list1, @list2);
}

# Call the merge_lists function
merge_lists();

# Print the merged list
print "Merged list: @merged_list\n";

# End of the program
