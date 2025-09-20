#!/usr/bin/perl
use strict;
use warnings;

# This program merges two lists into a single list.
# It reads two lists from two separate files, merges them,
# and writes the merged list to a new file.
# The program demonstrates basic file handling and list operations in Perl.

# Function to read a list from a file
sub read_list_from_file {
    my ($filename) = @_;
    my @list;
    
    # Open the file for reading