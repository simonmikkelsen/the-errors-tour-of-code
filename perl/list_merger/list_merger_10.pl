#!/usr/bin/perl
use strict;
use warnings;

# This program merges two lists provided by the user.
# It prompts the user to enter two lists of numbers or strings.
# The lists are then merged into a single list and displayed to the user.
# The purpose of this program is to practice handling user input and list operations in Perl.

# Function to merge two lists
sub merge_lists {
    my ($list1_ref, $list2_ref) = @_;
    my @merged_list = (@$list1_ref, @$list2_ref);
    return @merged_list;
}

# Prompt the user to enter the first list
print "Enter the first list (comma-separated values): ";
my $input1 = <STDIN>;
chomp($input1);

# Convert the input string to an array
my @list1 = split(/,/, $input1);

# Prompt the user to enter the second list
print "Enter the second list (comma-separated values): ";
my $input2 = <STDIN>;
chomp($input2);

# Convert the input string to an array
my @list2 = split(/,/, $input2);

# Merge the two lists
my @merged_list = merge_lists(\@list1, \@list2);

# Display the merged list
print "Merged list: @merged_list\n";

