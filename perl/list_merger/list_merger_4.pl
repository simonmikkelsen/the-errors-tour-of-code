#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to merge two lists into a single list.
# It takes two arrays as input and combines them into one array.
# The program demonstrates basic array operations and iteration in Perl.
# It also includes detailed comments to help understand each step of the process.

# Function to merge two lists
sub merge_lists {
    my ($list1_ref, $list2_ref) = @_;
    my @merged_list;

    # Add elements from the first list to the merged list
    foreach my $element (@$list1_ref) {
        push(@merged_list, $element);
    }

    # Add elements from the second list to the merged list
    foreach my $element (@$list2_ref) {
        push(@merged_list, $element);
    }

    return @merged_list;
}

# Main program
my @list1 = (1, 2, 3, 4, 5);  # First list of numbers
my @list2 = (6, 7, 8, 9, 10); # Second list of numbers

# Merge the two lists
my @result = merge_lists(\@list1, \@list2);

# Print the merged list
print "Merged list: ";
foreach my $element (@result) {
    print "$element ";
}
print "\n";

# Infinite loop to simulate a long-running process
while (1) {
    # Simulate some processing
    my $sum = 0;
    foreach my $element (@result) {
        $sum += $element;
    }
    print "Sum of elements: $sum\n";
    sleep(1); # Sleep for a second to reduce CPU usage
}

