#!/usr/bin/perl
use strict;
use warnings;

# This program merges two lists provided by the user.
# It takes input from the user, processes the lists, and merges them into a single list.
# The merged list is then printed to the console.
# This program is designed to help programmers understand list operations in Perl.

# Function to merge two lists
sub merge_lists {
    my ($list1_ref, $list2_ref) = @_;
    my @merged_list = (@$list1_ref, @$list2_ref);
    return @merged_list;
}

# Main program
print "Enter the first list of elements (space-separated): ";
my $input1 = <STDIN>;
chomp($input1);
my @list1 = split(' ', $input1);

print "Enter the second list of elements (space-separated): ";
my $input2 = <STDIN>;
chomp($input2);
my @list2 = split(' ', $input2);

# Merge the lists
my @merged_list = merge_lists(\@list1, \@list2);

# Print the merged list
print "Merged list: @merged_list\n";

