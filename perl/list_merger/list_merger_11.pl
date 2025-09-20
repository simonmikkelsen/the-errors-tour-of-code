#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to merge two lists of strings into a single list.
# It uses regular expressions extensively to demonstrate their usage in Perl.
# The program reads two lists from the user, merges them, and prints the result.

# Function to read a list from the user
sub read_list {
    my ($prompt) = @_;
    print "$prompt\n";
    my @list;
    while (my $line = <STDIN>) {
        chomp $line;
        last if $line eq '';
        push @list, $line;
    }
    return @list;
}

# Function to merge two lists
sub merge_lists {
    my (@list1, @list2) = @_;
    my @merged_list;
    while (@list1 || @list2) {
        push @merged_list, shift @list1 if @list1;
        push @merged_list, shift @list2 if @list2;
    }
    return @merged_list;
}

# Main program
print "Enter the first list (end with an empty line):\n";
my @list1 = read_list("First list:");

print "Enter the second list (end with an empty line):\n";
my @list2 = read_list("Second list:");

# Merge the lists
my @merged_list = merge_lists(@list1, @list2);

# Print the merged list
print "Merged list:\n";
foreach my $item (@merged_list) {
    print "$item\n";
}

