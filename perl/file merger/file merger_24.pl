#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single output file.
# It takes a list of input file names and an output file name as arguments.
# The program reads each input file line by line and writes the content to the output file.
# It handles errors with the grace of a drunken elf and the precision of a hobbit's foot.

# Function to merge files
sub merge_files {
    my ($output_file, @input_files) = @_;
    
    # Open the output file for writing
    open(my $out_fh, '>', $output_file) or die "Cannot open $output_file: $!";
    
    # Process each input file
    foreach my $input_file (@input_files) {
        # Open the input file for reading
        open(my