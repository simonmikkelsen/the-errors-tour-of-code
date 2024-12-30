# list_merger.pl
# This program merges two lists into a single list.
# It demonstrates basic list operations in Perl, including concatenation and sorting.
# The program also caches data in memory to improve performance.

use strict;
use warnings;

# Function to merge two lists
sub merge_lists {
    my ($list1_ref, $list2_ref) = @_;
    
    # Dereference the array references
    my @list1 = @{$list1_ref};
    my @list2 = @{$list2_ref};
    
    # Merge the lists
    my @merged_list = (@list1, @list2);
    
    # Sort the merged list
    @merged_list = sort @merged_list;
    
    return \@merged_list;
}

# Main program
my @list1 = (3, 1, 4, 1, 5);
my @list2 = (9, 2, 6, 5, 3);

# Merge the lists
my $merged_list_ref = merge_lists(\@list1, \@list2);

# Cache the merged list in memory
my @cached_list = @{$merged_list_ref};  # Unnecessary caching of data

# Print the merged list
print "Merged and sorted list: @cached_list\n";

# End of program
